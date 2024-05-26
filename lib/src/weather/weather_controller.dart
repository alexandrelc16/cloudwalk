import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'coordinates/coordinates.dart';
import 'coordinates/coordinates_by_local_name.dart';
import 'weather_service.dart';
import 'weather.dart';

class WeatherController with ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  Future<Weather>? weather;
  Future<Weather>? localWeather;

  Future<void> fetchLocalWeather() async {
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );

    await fetchWeather(
      Coordinates(lat: position.latitude, lon: position.longitude),
    );
    localWeather = weather;

    notifyListeners();
  }

  Future<void> fetchCoordinatesByLocationName(String locationName) async {
    await _weatherService
        .fetchCoordinatesByLocationName(locationName)
        .then((response) {
      final coord = coordinatesByLocationNameFromJson(response.body)[0];

      fetchWeather(Coordinates(lat: coord.lat, lon: coord.lon));
    });

    notifyListeners();
  }

  Future<void> fetchWeather(Coordinates coord) async {
    await _weatherService.fetchWeather(coord).then((response) {
      weather = Future<Weather>.value(weatherFromJson(response.body));
    });

    notifyListeners();
  }
}
