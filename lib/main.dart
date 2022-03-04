import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';
import 'package:weather_app/bloc/weather_bloc_observer.dart';
import 'package:weather_app/network/weather_repository.dart';

import 'ui/home_page.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: WeatherBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherBloc(
            repository: WeatherRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          primaryColorDark: Colors.cyan,
          brightness: Brightness.dark,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            hoverColor: Colors.transparent,
            backgroundColor: Colors.cyan,
          ),
        ),
        home: const MyHomePage(
          title: 'Weather App',
        ),
      ),
    );
  }
}
