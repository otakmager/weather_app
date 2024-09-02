import 'package:weather_app/data/model/parameter_weather.dart';

import '../data/model/weather.dart';

Parameter? getSpecificParameter(String desc, Area area) {
  Parameter? foundParameter = area.parameter?.firstWhere(
    (parameter) => parameter.description == desc,
  );
  return foundParameter;
}

ParameterWeather getParameterWeather(Area area) {
  return ParameterWeather(
      humidity: getSpecificParameter('Humidity', area),
      maxHumidity: getSpecificParameter('Max humidity', area),
      minHumidity: getSpecificParameter('Min humidity', area),
      temperature: getSpecificParameter('Temperature', area),
      maxTemperature: getSpecificParameter('Max temperature', area),
      minTemperature: getSpecificParameter('Min temperature', area),
      weather: getSpecificParameter('Weather', area),
      windDirection: getSpecificParameter('Wind direction', area),
      windSpeed: getSpecificParameter('Wind speed', area));
}
