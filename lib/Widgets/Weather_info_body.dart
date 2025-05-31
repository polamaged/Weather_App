import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wether_app/Model/Weather_Model.dart';
import 'package:wether_app/main.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});
  @override
  Widget build(BuildContext context) {
    WeatherModel weathermodel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [

           getthemecolor(weathermodel.Weather_condition),
           getthemecolor(weathermodel.Weather_condition)[300]!,
           getthemecolor(weathermodel.Weather_condition)[100]!,
           getthemecolor(weathermodel.Weather_condition)[50]!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(weathermodel.City_name,style:TextStyle(fontSize: 32 , fontWeight: FontWeight.bold) ,),
              Text('Updated at ${weathermodel.Data.hour} : ${weathermodel.Data.minute}',style:TextStyle(fontSize: 28) ,),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network('https:${weathermodel.imag!}'),
                  Text(weathermodel.Avrtemp.round().toString(), style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                  Column(
                    children: [
                      Text('Max Temp : ${weathermodel.Maxtemp.round()}',style: TextStyle(fontSize: 16),),
                      Text("Min Temp : ${weathermodel.Mintemp.round()} ",style: TextStyle(fontSize: 16),),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Text(weathermodel.Weather_condition,style: TextStyle(fontSize: 32 , fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}
