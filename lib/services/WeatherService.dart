import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wether_app/Model/Weather_Model.dart';

class Weatherservice {
  final Dio dio;
  final String base_url = 'https://api.weatherapi.com/v1';
  final String apikey = '8ee33670d93c4792bcf142720252605';

  Weatherservice(this.dio);

  Future<WeatherModel> GetCurrentWeather({required String cityname}) async {
    try {
      Response response = await dio.get(
        '$base_url/forecast.json?key=$apikey&q=$cityname&days=1',
      );

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errormessega =
          e.response?.data['error']['message'] ??
          'oops there was an error , try later';
      throw Exception(errormessega);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error , try later');
    }
  }
}
