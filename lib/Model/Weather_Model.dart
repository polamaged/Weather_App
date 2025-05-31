class WeatherModel {
  final String City_name;
  final DateTime Data;
  final String? imag;
  final double Avrtemp;
  final double Maxtemp;
  final double Mintemp;
  final String Weather_condition;

  WeatherModel({
    required this.City_name,
    required this.Data,
    this.imag,
    required this.Avrtemp,
    required this.Maxtemp,
    required this.Mintemp,
    required this.Weather_condition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      City_name: json['location']['name'],
      Data: DateTime.parse(json['current']['last_updated']),
      Avrtemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      Maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      Mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      Weather_condition:
          json['forecast']['forecastday'][0]['day']['condition']['text'],
      imag: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
