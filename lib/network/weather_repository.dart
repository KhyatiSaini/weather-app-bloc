import 'package:dio/dio.dart';
import 'package:weather_app/network/weather_api_client.dart';
import 'package:weather_app/data/weather_response.dart';
import 'package:weather_app/network/weather_data_source.dart';
import 'package:weather_app/utilities/constant.dart';

class WeatherRepository extends WeatherDataSource {
  Dio _dio = Dio();
  WeatherApiClient _weatherApiClient = WeatherApiClient(Dio());

  WeatherRepository() {
    _dio = Dio();
    _weatherApiClient = WeatherApiClient(_dio);
  }

  @override
  Future<WeatherResponse?> getCityWeatherResponse(String cityName) {
    return _weatherApiClient.getCityWeatherResponse(cityName, apiKey);
  }
}