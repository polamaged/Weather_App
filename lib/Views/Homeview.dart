import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wether_app/Cubits/get_weather_cubit/get_weather_states.dart';
import 'package:wether_app/Views/SearchView.dart';
import 'package:wether_app/Widgets/No_Weather_body.dart';
import 'package:wether_app/Widgets/Weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App'),
        centerTitle: true,
        actions: [
         IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Searchview();
            },));
         }, icon: Icon(Icons.search))
        ],
      ),
      body:BlocBuilder<GetWeatherCubit,WeatherState>
      (builder: (context, state) 
      {
       if(state is WeatherInitalState)
       {
        return const NoWeatherBody();
       } 
       else if(state is WeatherLoadedState)
       {
        return WeatherInfoBody();
       }else {
        return const Text('oops there is an error , try later');
       }

      },),
      
      
    );
  }
}
