import '../model/custom_exception.dart';
import '../model/failure_model.dart';
import '../model/locations.dart';
import '../model/weather.dart';
import '../service/api_service.dart';

class WeatherRepository {
  final ApiService apiService;

  WeatherRepository({required this.apiService});

  Future<Locations> getLocations() async {
    try {
      final data = await apiService.getLocations();
      return data;
    } on CustomException {
      rethrow;
    } catch (e) {
      throw CustomException(FailureModel(-1, e.toString()));
    }
  }

  Future<Weather> getWeather(String provinceId) async {
    try {
      final data = await apiService.getWeather(provinceId);
      return data;
    } on CustomException {
      rethrow;
    } catch (e) {
      throw CustomException(FailureModel(-1, e.toString()));
    }
  }
}
