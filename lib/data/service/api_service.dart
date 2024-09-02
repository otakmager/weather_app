import 'package:dio/dio.dart';

import '../../utils/constants.dart';
import '../model/custom_exception.dart';
import '../model/failure_model.dart';
import '../model/locations.dart';
import '../model/weather.dart';

class ApiService {
  final Dio _dio;

  ApiService({required Dio dio}) : _dio = dio;

  Future<Locations> getLocations() async {
    const finalUrl = '$url/provinces';

    try {
      final response = await _dio.get(finalUrl,
          options: Options(headers: {
            'content-type': 'application/json',
            'Access-Control-Allow-Origin': 'true'
          }));
      if (response.statusCode == 200) {
        return Locations.fromJson(response.data);
      } else {
        throw CustomException(
            FailureModel(response.statusCode, response.statusMessage));
      }
    } on DioException catch (e) {
      throw CustomException(FailureModel(e.response?.statusCode, e.message));
    } catch (e) {
      throw CustomException(FailureModel(-1, e.toString()));
    }
  }

  Future<Weather> getWeather(String provinceId) async {
    final finalUrl = '$url/weather/$provinceId';

    try {
      final response = await _dio.get(finalUrl,
          options: Options(headers: {
            'content-type': 'application/json',
            'Access-Control-Allow-Origin': 'true'
          }));
      if (response.statusCode == 200) {
        return Weather.fromJson(response.data);
      } else {
        throw CustomException(
            FailureModel(response.statusCode, response.statusMessage));
      }
    } on DioException catch (e) {
      throw CustomException(FailureModel(e.response?.statusCode, e.message));
    } catch (e) {
      throw CustomException(FailureModel(-1, e.toString()));
    }
  }
}
