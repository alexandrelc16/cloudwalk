import 'package:http/http.dart' as http;

import 'coordinates/coordinates.dart';

class WeatherService {
  static const appId = '158044ab0d47961003c5ca77078beed9';

  Future<http.Response> fetchWeather(Coordinates coord) async {
    return await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${coord.lat}&lon=${coord.lon}&units=metric&appid=$appId'));
  }

  Future<http.Response> fetchCoordinatesByLocationName(
      String locationName) async {
    return await http.get(Uri.parse(
        'http://api.openweathermap.org/geo/1.0/direct?q=$locationName&limit=1&appid=$appId'));
  }
}
