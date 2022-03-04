import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';
import 'package:weather_app/bloc/weather/weather_event.dart';
import 'package:weather_app/bloc/weather/weather_state.dart';
import 'package:weather_app/ui/components/custom_list_tile.dart';
import 'package:weather_app/ui/components/data_display_widget.dart';
import 'package:weather_app/utilities/snack_bar.dart';
import 'package:weather_app/utilities/extension.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController cityNameEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      height: 50,
                      child: Center(
                        child: TextFormField(
                          controller: cityNameEditingController,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'City Name',
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (cityNameEditingController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                            getSnackBar('Please enter a city name'));
                      } else {
                        BlocProvider.of<WeatherBloc>(context).add(
                            LoadWeatherEvent(cityNameEditingController.text));
                      }
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.search_rounded,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              width: double.infinity,
              child: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherStateHasData) {
                    print(state.response);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DataDisplayWidget(
                          heading: 'Coordinates',
                          iconData: Icons.location_on,
                          listData: [
                            CustomListTile(
                              title: 'Latitude',
                              data: state.response.coordinates!.lat.toString(),
                              givePadding: false,
                            ),
                            CustomListTile(
                              title: 'Longitude',
                              data: state.response.coordinates!.lon.toString(),
                            ),
                          ],
                        ),
                        DataDisplayWidget(
                          heading: 'Weather',
                          iconData: Icons.sunny_snowing,
                          listData: [
                            CustomListTile(
                              title: 'Weather',
                              data:
                                  state.response.weather!.first.main.toString(),
                              givePadding: false,
                            ),
                            CustomListTile(
                              title: 'Description',
                              data: state.response.weather!.first.description
                                  .toString()
                                  .capitalize(),
                            ),
                          ],
                        ),
                        DataDisplayWidget(
                          heading: 'Temperature',
                          iconData: Icons.wb_sunny_outlined,
                          listData: [
                            CustomListTile(
                              title: 'Temperature',
                              data: '${state.response.main!.temp.toString()} K',
                              givePadding: false,
                            ),
                            CustomListTile(
                              title: 'Minimum Temperature',
                              data:
                                  '${state.response.main!.tempMin.toString()} K',
                            ),
                            CustomListTile(
                              title: 'Maximum Temperature',
                              data:
                                  '${state.response.main!.tempMax.toString()} K',
                            ),
                            CustomListTile(
                              title: 'Pressure',
                              data:
                                  '${state.response.main!.pressure.toString()} Pa',
                            ),
                            CustomListTile(
                              title: 'Humidity',
                              data: state.response.main!.humidity.toString(),
                            ),
                            CustomListTile(
                              title: 'Wind speed',
                              data: state.response.wind!.speed.toString(),
                            ),
                            CustomListTile(
                              title: 'Wind Direction',
                              data: state.response.wind!.deg.toString(),
                            ),
                            CustomListTile(
                              title: 'Sunrise',
                              data: state.response.sys!.sunrise.toString(),
                            ),
                            CustomListTile(
                              title: 'Sunset',
                              data: state.response.sys!.sunset.toString(),
                            ),
                            CustomListTile(
                              title: 'Clouds',
                              data: state.response.clouds!.all.toString(),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else if (state is LoadingWeatherState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
