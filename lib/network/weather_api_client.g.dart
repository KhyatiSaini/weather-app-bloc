// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _WeatherApiClient implements WeatherApiClient {
  _WeatherApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.openweathermap.org/data/2.5/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<WeatherResponse> getCityWeatherResponse(cityName, apiKey) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'q': cityName, r'appid': apiKey};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WeatherResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'weather/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WeatherResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
