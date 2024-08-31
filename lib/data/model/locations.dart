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
}
