import 'package:cloudwalk/src/weather/weather_controller.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();

  final WeatherController weatherController = WeatherController();

  runApp(MyApp(
    settingsController: settingsController,
    weatherController: weatherController,
  ));
}
