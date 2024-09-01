import 'weather.dart';

class Locations {
  Meta meta;
  List<Location> data;

  Locations({
    required this.meta,
    required this.data,
  });

  Locations.fromJson(Map<String, dynamic> json)
      : meta = Meta.fromJson(json['meta']),
        data =
            List<Location>.from(json['data'].map((x) => Location.fromJson(x)));
}

class Location {
  String id;
  String name;

  Location({
    required this.id,
    required this.name,
  });

  Location.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  static List<Location> example = [
    Location(id: "Aceh", name: "Provinsi Aceh"),
    Location(id: "Bali", name: "Provinsi Bali"),
    Location(id: "BangkaBelitung", name: "Provinsi Bangka Belitung"),
    Location(id: "Banten", name: "Provinsi Banten"),
    Location(id: "Bengkulu", name: "Provinsi Bengkulu"),
    Location(id: "DIYogyakarta", name: "Provinsi DI Yogyakarta"),
    Location(id: "DKIJakarta", name: "Provinsi DKI Jakarta"),
    Location(id: "Gorontalo", name: "Provinsi Gorontalo"),
    Location(id: "Jambi", name: "Provinsi Jambi"),
    Location(id: "JawaBarat", name: "Provinsi Jawa Barat"),
    Location(id: "JawaTengah", name: "Provinsi Jawa Tengah"),
    Location(id: "JawaTimur", name: "Provinsi Jawa Timur"),
  ];
}

class City {
  String id;
  String name;

  City({
    required this.id,
    required this.name,
  });
}
