import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({
    super.key,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.feelsLike,
    required this.humidity,
    required this.main,
  });

  final double temp;
  final double tempMin;
  final double tempMax;
  final double feelsLike;
  final int humidity;
  final String main;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${AppLocalizations.of(context)!.main}: $main'),
        Text('${AppLocalizations.of(context)!.temp}: ${temp.toString()}°'),
        Text('${AppLocalizations.of(context)!.min}: ${tempMin.toString()}°'),
        Text('${AppLocalizations.of(context)!.max}: ${tempMax.toString()}°'),
        Text(
            '${AppLocalizations.of(context)!.feelsLike}: ${feelsLike.toString()}°'),
        Text(
            '${AppLocalizations.of(context)!.humidity}: ${humidity.toString()}%'),
      ],
    );
  }
}
