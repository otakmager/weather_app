import 'package:flutter/material.dart';

import '../../data/model/custom_exception.dart';
import '../../data/model/failure_model.dart';
import '../../data/model/locations.dart';
import '../../data/model/ui_state.dart';
import '../../data/model/weather.dart';
import '../../data/repository/weather_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final WeatherRepository weatherRepository;

  HomeViewModel({required this.weatherRepository});

  UiState? _uiStateProvinces;
  UiState? _uiStateWeather;
  FailureModel? _errorInfo;
  List<Location>? _listLocations;
  Forecast? _weather;

  UiState? get uiStateProvinces => _uiStateProvinces;
  UiState? get uiStateWeather => _uiStateWeather;
  FailureModel? get errorInfo => _errorInfo;
  List<Location>? get listLocations => _listLocations;
  Forecast? get weather => _weather;

  void setUiStateProvinces(UiState? uiState) {
    _uiStateWeather = uiState;
    notifyListeners();
  }

  void setUiStateWeather(UiState? uiState) {
    _uiStateWeather = uiState;
    notifyListeners();
  }

  Future<void> getLocations() async {
    setUiStateProvinces(UiState.loading);

    try {
      final data = await weatherRepository.getLocations();
      _listLocations = data.data;
      setUiStateProvinces(UiState.success);
    } on CustomException catch (e) {
      _errorInfo = FailureModel(e.statusCode, e.message);
      setUiStateProvinces(UiState.error);
    } catch (e) {
      _errorInfo = FailureModel(-1, e.toString());
      setUiStateProvinces(UiState.error);
    } finally {
      notifyListeners();
    }
  }

  Future<void> getWeather(String provinceId) async {
    setUiStateWeather(UiState.loading);

    try {
      final data = await weatherRepository.getWeather(provinceId);
      _weather = data.data.forecast;
      setUiStateWeather(null);
    } on CustomException catch (e) {
      _errorInfo = FailureModel(e.statusCode, e.message);
      setUiStateWeather(UiState.error);
    } catch (e) {
      _errorInfo = FailureModel(-1, e.toString());
      setUiStateWeather(UiState.error);
    } finally {
      notifyListeners();
    }
  }
}
