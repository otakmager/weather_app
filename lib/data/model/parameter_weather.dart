import '../../utils/get_weather.dart';
import 'weather.dart';

class ParameterWeather {
  Parameter? humidity;
  Parameter? maxHumidity;
  Parameter? minHumidity;
  Parameter? temperature;
  Parameter? maxTemperature;
  Parameter? minTemperature;
  Parameter? weather;
  Parameter? windDirection;
  Parameter? windSpeed;

  ParameterWeather(
      {required this.humidity,
      required this.maxHumidity,
      required this.minHumidity,
      required this.temperature,
      required this.maxTemperature,
      required this.minTemperature,
      required this.weather,
      required this.windDirection,
      required this.windSpeed});

  String getTemperature() {
    return temperature?.timerange.first.value[0].text ?? "N/A";
  }

  String getMinMaxTemperature() {
    return "${minTemperature?.timerange.first.value[0].text ?? "N/A"}°/${maxTemperature?.timerange.first.value[0].text ?? "N/A"}°";
  }

  String getInfoWeather() {
    final data = weather?.timerange.first.value[0].text ?? "";
    return getWeather(data);
  }

  String getAssetWeather() {
    final data = weather?.timerange.first.value[0].text ?? "";
    return getWeatherAssets(data);
  }
}
