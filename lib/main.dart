import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wether_app/Cubits/get_weather_cubit/get_weather_states.dart';
import 'package:wether_app/Views/Homeview.dart';

void main() {
  runApp(const Weather_app());
}

class Weather_app extends StatelessWidget {
  const Weather_app({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder:
            (context) => BlocBuilder<GetWeatherCubit,WeatherState>(
              builder: (context, state) {
                return MaterialApp(
                  theme: ThemeData(
                    useMaterial3: false,
                    primarySwatch: getthemecolor(
                      BlocProvider.of<GetWeatherCubit>(
                        context,
                      ).weatherModel?.Weather_condition,
                    ),
                  ),
                  debugShowCheckedModeBanner: false,
                  home: HomeView(),
                );
              },
            ),
      ),
    );
  }
}

MaterialColor getthemecolor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  log(condition);

  switch (condition) {
    // Clear/Sunny conditions
    case 'Sunny':
    case 'Clear':
      return Colors.amber;

    // Cloudy conditions
    case 'Partly Cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.blueGrey;

    // Fog/Mist conditions
    case 'Mist':
    case 'Fog':
    case 'Freezing Fog':
      return Colors.grey;

    // Rain conditions
    case 'Patchy Rain':
    case 'Light Rain':
    case 'Moderate Rain':
    case 'Rain':
      return Colors.blue;

    // Heavy rain
    case 'Heavy Rain':
    case 'Torrential Rain':
      return Colors.indigo;

    // Snow conditions
    case 'Patchy Snow':
    case 'Light Snow':
    case 'Moderate Snow':
    case 'Snow':
    case 'Blowing Snow':
      return Colors.lightBlue;

    // Heavy snow
    case 'heavy snow':
    case 'blizzard':
      return Colors.blue;

    // Freezing
    case 'freezing drizzle':
    case 'freezing rain':
    case 'sleet':
      return Colors.blue;

    // Thunder
    case 'thunder':
    case 'thundery':
      return Colors.deepPurple;

    // Ice
    case 'ice pellets':
      return Colors.blue;

    // Default
    default:
      return Colors.grey;
  }
}
