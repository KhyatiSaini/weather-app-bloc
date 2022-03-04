import 'package:weather_app/data/weather_response.dart';

abstract class WeatherDataSource {
  Future<WeatherResponse?> getCityWeatherResponse(String cityName);
}