import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app/Cubits/get_weather_cubit/get_weather_states.dart';
import 'package:wether_app/Model/Weather_Model.dart';
import 'package:wether_app/Views/SearchView.dart';
import 'package:wether_app/services/WeatherService.dart';

class GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit():super(WeatherInitalState());

 WeatherModel? weatherModel;
GetWeather({required String cityname})async{
   try {
  weatherModel = await Weatherservice(Dio()).GetCurrentWeather(cityname: cityname);
    emit(WeatherLoadedState());
} catch (e) {
    emit(WeatherFailureState());
}
 
}

}