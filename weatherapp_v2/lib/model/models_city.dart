class City {
  final int id;
  final String name;
  final String country;
  final Coord coord;

  City({
    required this.id,
    required this.name,
    required this.country,
    required this.coord,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      country: json['country'],
      coord: Coord.fromJson(json['coord']),
    );
  }
}

class Coord {
  final double lon;
  final double lat;

  Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: json['lon'],
      lat: json['lat'],
    );
  }
}
