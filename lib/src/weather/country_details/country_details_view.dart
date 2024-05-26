import 'package:flutter/material.dart';

import '../weather_controller.dart';
import '../weather_view.dart';

class CountryDetailsView extends StatelessWidget {
  const CountryDetailsView({
    super.key,
    required this.title,
    required this.controller,
  });

  static const routeName = '/sample_item';
  final String title;
  final WeatherController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: controller.weather,
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
            )
          ],
        ),
      ),
    );
  }
}
