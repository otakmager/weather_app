import '../data/model/locations.dart';
import '../data/model/weather.dart';

List<City> getListCity(List<Area> areas) {
  List<City> cities = [];
  for (var area in areas) {
    City city =
        City(index: areas.indexOf(area), id: area.name[0], name: area.name[1]);
    cities.add(city);
  }
  return cities;
}
