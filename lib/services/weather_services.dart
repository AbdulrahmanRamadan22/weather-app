import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherServices {
  final Dio dio;

  final String baseUrl = "https://api.weatherapi.com/v1";

  final String apiKey = "4612a7f8fc05419e9ee165820230310%20";

  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMassage = e.response?.data['error']['massage'] ??
          "oops there was an error ,try later";
      throw Exception(errorMassage);
    } catch (e) {
      log(e.toString());
      throw Exception("oops there was an error ,try later");
    }
  }
}
