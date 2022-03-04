import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    if (kDebugMode) {
      print('bloc: ${bloc.runtimeType}, event: $event');
    }
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      print('bloc: ${bloc.runtimeType}, change: $change]'
     );
    }
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    if (kDebugMode) {
      print('bloc: ${bloc.runtimeType}');
    }
    super.onCreate(bloc);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (kDebugMode) {
      print('bloc: ${bloc.runtimeType}, transition: $transition');
    }
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('bloc: ${bloc.runtimeType}, error: ${error.runtimeType}, stackTrack: $stackTrace');
    }
    super.onError(bloc, error, stackTrace);
  }
}