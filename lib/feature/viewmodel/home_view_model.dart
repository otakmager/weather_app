import 'package:flutter/material.dart';
import 'package:weather_app/data/model/parameter_weather.dart';

import '../../data/model/custom_exception.dart';
import '../../data/model/failure_model.dart';
import '../../data/model/locations.dart';
import '../../data/model/ui_state.dart';
import '../../data/model/weather.dart';
import '../../data/repository/weather_repository.dart';
import '../../utils/get_list_city.dart';
import '../../utils/get_specific_parameter.dart';

class HomeViewModel extends ChangeNotifier {
  final WeatherRepository weatherRepository;

  HomeViewModel({required this.weatherRepository});

  UiState? _uiStateProvinces;
  UiState? _uiStateWeather;
  FailureModel? _errorInfo;
  List<Location>? _listLocations;
  List<City>? _listCity;
  Forecast? _weather;
  ParameterWeather? _parameterWeather;
  int _idxSelectedProv = 0;
  int _idxSelectedCity = 0;
  bool isReady = false;

  UiState? get uiStateProvinces => _uiStateProvinces;
  UiState? get uiStateWeather => _uiStateWeather;
  FailureModel? get errorInfo => _errorInfo;
  List<Location>? get listLocations => _listLocations;
  List<City>? get listCity => _listCity;
  Forecast? get weather => _weather;
  ParameterWeather? get parameterWeather => _parameterWeather;
  int get idxSelectedProv => _idxSelectedProv;
  int get idxSelectedCity => _idxSelectedCity;

  void setUiStateProvinces(UiState? uiState) {
    _uiStateProvinces = uiState;
    notifyListeners();
  }

  void setUiStateWeather(UiState? uiState) {
    _uiStateWeather = uiState;
    notifyListeners();
  }

  void setIsReady(bool value) {
    isReady = value;
    notifyListeners();
  }

  void setIdxSelectedProv(int idx) {
    _idxSelectedProv = idx;
    notifyListeners();
  }

  void setIdxSelectedCity(int idx) {
    // set id
    _idxSelectedCity = idx;

    // set parameter weather
    if (_weather != null) {
      final area = _weather!.area[_idxSelectedCity];
      _parameterWeather = getParameterWeather(area);
    }

    // notify
    notifyListeners();
  }

  Future<void> getLocations() async {
    setUiStateProvinces(UiState.loading);

    try {
      final data = await weatherRepository.getLocations();
      List<Location>? temp = data.data;
      temp.removeLast(); // delete "Prov. Indonesia" because cannot be used for getWeather()
      _listLocations = temp;
      setUiStateProvinces(UiState.success);
    } on CustomException catch (e) {
      _errorInfo = FailureModel(e.statusCode, e.message);
      setUiStateProvinces(UiState.error);
    } catch (e) {
      _errorInfo = FailureModel(-1, e.toString());
      setUiStateProvinces(UiState.error);
    } finally {
      notifyListeners();
      if (_listLocations != null) {
        final provinceId = _listLocations?.first.id;
        getWeather(provinceId ?? "");
      }
    }
  }

  Future<void> getWeather(String provinceId) async {
    setUiStateWeather(UiState.loading);
    setIsReady(false);

    try {
      final data = await weatherRepository.getWeather(provinceId);
      _weather = data.data.forecast;
      _listCity = getListCity(_weather!.area);
      setUiStateWeather(null);
    } on CustomException catch (e) {
      _errorInfo = FailureModel(e.statusCode, e.message);
      setUiStateWeather(UiState.error);
    } catch (e) {
      _errorInfo = FailureModel(-1, e.toString());
      setUiStateWeather(UiState.error);
    } finally {
      if (_weather != null) {
        setIdxSelectedCity(0);
        setIsReady(true);
      }
      notifyListeners();
    }
  }
}
