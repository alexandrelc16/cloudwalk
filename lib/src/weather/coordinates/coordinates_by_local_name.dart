import 'dart:convert';

List<CoordinatesByLocationName> coordinatesByLocationNameFromJson(String str) =>
    List<CoordinatesByLocationName>.from(
        json.decode(str).map((x) => CoordinatesByLocationName.fromJson(x)));

String coordinatesByLocationNameToJson(List<CoordinatesByLocationName> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoordinatesByLocationName {
  String name;
  Map<String, String>? localNames;
  double lat;
  double lon;
  String country;
  String? state;

  CoordinatesByLocationName({
    required this.name,
    this.localNames,
    required this.lat,
    required this.lon,
    required this.country,
    this.state,
  });

  factory CoordinatesByLocationName.fromJson(Map<String, dynamic> json) =>
      CoordinatesByLocationName(
        name: json["name"],
        localNames: Map.from(json["local_names"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        country: json["country"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "local_names": Map.from(localNames!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "lat": lat,
        "lon": lon,
        "country": country,
        "state": state,
      };
}
