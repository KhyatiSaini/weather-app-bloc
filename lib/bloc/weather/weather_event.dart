import '../../data/weather_response.dart';

abstract class WeatherEvent {
  final String cityName;

  const WeatherEvent(this.cityName);

  WeatherResponse get weatherResponse => WeatherResponse();
}

class LoadWeatherEvent extends WeatherEvent {
  LoadWeatherEvent(String cityName) : super(cityName);
}


