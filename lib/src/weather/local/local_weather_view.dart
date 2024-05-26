import 'package:flutter/material.dart';

import '../weather_controller.dart';
import '../weather_view.dart';

class LocalWeatherView extends StatefulWidget {
  const LocalWeatherView({super.key, required this.controller});

  final WeatherController controller;

  @override
  State<LocalWeatherView> createState() => _LocalWeatherViewState();
}

class _LocalWeatherViewState extends State<LocalWeatherView> {
  @override
  void initState() {
    super.initState();
    widget.controller.fetchLocalWeather();
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.controller.localWeather,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return WeatherView(
            temp: snapshot.data!.main.temp!,
            tempMin: snapshot.data!.main.tempMin!,
            tempMax: snapshot.data!.main.tempMax!,
            feelsLike: snapshot.data!.main.feelsLike!,
            humidity: snapshot.data!.main.humidity!,
            main: snapshot.data!.weather[0].main,
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
