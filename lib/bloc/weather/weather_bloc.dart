import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weather_event.dart';
import 'package:weather_app/bloc/weather/weather_state.dart';
import 'package:weather_app/data/weather_response.dart';
import 'package:weather_app/network/weather_data_source.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherDataSource repository;

  WeatherBloc({required this.repository}) : super(InitialWeatherState()) {
    on((WeatherEvent event, emit) async {
      await getCityWeather(emit, event.cityName);
    });
  }

  Future getCityWeather(Emitter<WeatherState> emit, String cityName) async {
    emit(LoadingWeatherState());
    try {
      WeatherResponse? weatherResponse =
          await repository.getCityWeatherResponse(cityName);
      if (weatherResponse != null) {
        emit(WeatherStateHasData(weatherResponse));
      } else {
        emit(const WeatherStateNoData('no data'));
      }
    } catch (e) {
      emit(WeatherStateError(e.toString()));
    }
  }
}
