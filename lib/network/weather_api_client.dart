import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../data/weather_response.dart';

part 'weather_api_client.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/data/2.5/")
abstract class WeatherApiClient {
  factory WeatherApiClient(Dio dio, {String? baseUrl}) => _WeatherApiClient(dio);

  @GET("weather/")
  Future<WeatherResponse> getCityWeatherResponse(@Query("q") String cityName, @Query("appid") String apiKey);
}