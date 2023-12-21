class WeatherModel {
  final String cityName;
  final DateTime lastUpdated;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String stateWeather;
  final String icon;

  WeatherModel(
      {required this.cityName,
      required this.lastUpdated,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.stateWeather,
      required this.icon});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      lastUpdated: DateTime.parse(
        json['current']['last_updated'],
      ),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      stateWeather: json['current']['condition']['text'],
      icon: json['current']['condition']['icon'],
    );
  }
}
