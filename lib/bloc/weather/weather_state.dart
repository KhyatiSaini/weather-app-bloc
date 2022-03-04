import 'package:weather_app/data/weather_response.dart';

abstract class WeatherState {
  const WeatherState();

  WeatherResponse? get response => WeatherResponse();
}

class InitialWeatherState extends WeatherState {}

class LoadingWeatherState extends WeatherState {}

class WeatherStateHasData extends WeatherState {
  final WeatherResponse weatherResponse;

  const WeatherStateHasData(this.weatherResponse);

  @override
  WeatherResponse get response => weatherResponse;
}

class WeatherStateNoData extends WeatherState {
  final String message;

  const WeatherStateNoData(this.message);

  @override
  WeatherResponse? get response => WeatherResponse();

  @override
  String toString() {
    return 'Weather state no data: (message: $message)';
  }
}

class WeatherStateNoInternetConnection extends WeatherState {
  final String message;

  const WeatherStateNoInternetConnection(this.message);

  @override
  WeatherResponse get response => WeatherResponse();

  @override
  String toString() {
    return 'Weather state no internet connection: (message: $message)';
  }
}

class WeatherStateError extends WeatherState {
  final String message;

  const WeatherStateError(this.message);

  @override
  WeatherResponse get response => WeatherResponse();

  @override
  String toString() {
    return 'Weather state error: (message: $message)';
  }
}
