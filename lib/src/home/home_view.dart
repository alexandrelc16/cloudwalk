import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../settings/settings_view.dart';
import '../weather/local/local_weather_view.dart';
import '../weather/country_list/country_list_view.dart';
import '../weather/country_list/country_list_controller.dart';
import '../weather/weather_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.controller});

  static const routeName = '/';

  final WeatherController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.currentWeather,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: controller,
        builder: (BuildContext context, Widget? child) {
          return Column(
            children: [
              LocalWeatherView(controller: controller),
              const SizedBox(height: 32),
              Expanded(
                child: CountryListView(
                  controller: controller,
                  countryList: CountryListController.countryList,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
