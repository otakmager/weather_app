class Weather {
  Meta meta;
  Data data;

  Weather({
    required this.meta,
    required this.data,
  });

  Weather.fromJson(Map<String, dynamic> json)
      : meta = Meta.fromJson(json['meta']),
        data = Data.fromJson(json['data']);
}

class Data {
  Forecast forecast;

  Data({
    required this.forecast,
  });

  Data.fromJson(Map<String, dynamic> json)
      : forecast = Forecast.fromJson(json['forecast']);
}

class Forecast {
  String domain;
  String timestamp;
  List<Area> area;

  Forecast({
    required this.domain,
    required this.timestamp,
    required this.area,
  });

  Forecast.fromJson(Map<String, dynamic> json)
      : domain = json['domain'],
        timestamp = json['timestamp'],
        area = List<Area>.from(json['area'].map((x) => Area.fromJson(x)));

  bool isNight({int index = 0}) {
    int hour = int.parse(timestamp.substring(8, 10));
    if (hour >= 0 && hour <= 4) {
      return true;
    } else if (hour >= 5 && hour <= 17) {
      return false;
    } else {
      return true;
    }
  }

  String getDate() {
    final year = timestamp.substring(0, 4);
    final month = timestamp.substring(4, 6);
    final day = timestamp.substring(6, 8);

    final monthNames = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    return '$day ${monthNames[int.parse(month)]} $year';
  }
}

class Area {
  String id;
  String latitude;
  String longitude;
  String coordinate;
  String type;
  dynamic region;
  String level;
  String description;
  String domain;
  String? tags;
  List<String> name;
  List<Parameter>? parameter;

  Area({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.coordinate,
    required this.type,
    required this.region,
    required this.level,
    required this.description,
    required this.domain,
    required this.tags,
    required this.name,
    this.parameter,
  });

  Area.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        coordinate = json['coordinate'],
        type = json['type'],
        region = json['region'],
        level = json['level'],
        description = json['description'],
        domain = json['domain'],
        tags = json['tags'],
        name = List<String>.from(json['name'].map((x) => x)),
        parameter = json['parameter'] != null
            ? List<Parameter>.from(
                json['parameter'].map((x) => Parameter.fromJson(x)))
            : null;
}

class Parameter {
  String description;
  List<Timerange> timerange;

  Parameter({
    required this.description,
    required this.timerange,
  });

  Parameter.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        timerange = List<Timerange>.from(
            json['timerange'].map((x) => Timerange.fromJson(x)));
}

class Timerange {
  String type;
  String datetime;
  List<Value> value;

  Timerange({
    required this.type,
    required this.datetime,
    required this.value,
  });

  Timerange.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        datetime = json['datetime'],
        value = List<Value>.from(json['value'].map((x) => Value.fromJson(x)));
}

class Value {
  String unit;
  String text;

  Value({
    required this.unit,
    required this.text,
  });

  Value.fromJson(Map<String, dynamic> json)
      : unit = json['unit'],
        text = json['text'];
}

class Meta {
  String copyright;
  String website;
  String? urlReference;

  Meta({
    required this.copyright,
    required this.website,
    required this.urlReference,
  });

  Meta.fromJson(Map<String, dynamic> json)
      : copyright = json['copyright'],
        website = json['website'],
        urlReference = json['url_reference'];
}
