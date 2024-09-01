import '../data/model/locations.dart';
import '../data/model/weather.dart';

List<City> getListCity(List<Area> areas) {
  List<City> cities = [];
  for (Area area in areas) {
    City city = City(id: area.name[0], name: area.name[1]);
    cities.add(city);
  }
  return cities;
}
