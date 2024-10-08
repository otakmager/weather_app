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

  String getTemperature({int index = 0}) {
    return temperature?.timerange[index].value[0].text ?? "N/A";
  }

  String getMinMaxTemperature() {
    return "${minTemperature?.timerange.first.value[0].text ?? "N/A"}°/${maxTemperature?.timerange.first.value[0].text ?? "N/A"}°";
  }

  String getInfoWeather({int index = 0}) {
    final data = weather?.timerange[index].value[0].text ?? "";
    return getWeather(data);
  }

  String getAssetWeather({int index = 0, bool isNight = false}) {
    final data = weather?.timerange[index].value[0].text ?? "";
    return getWeatherAssets(data, isNight: isNight);
  }

  String getHumidity({int index = 0}) {
    return humidity?.timerange[index].value[0].text ?? "N/A";
  }

  String getWindDirection({int index = 0}) {
    return windDirection?.timerange[index].value[1].text ?? "N/A";
  }

  String getWindSpeed({int index = 0}) {
    return windSpeed?.timerange[index].value[2].text ?? "N/A";
  }

  bool isNight({int index = 0}) {
    String dateTime = weather?.timerange[index].datetime ?? "";
    if (dateTime.isNotEmpty) {
      int hour = int.parse(dateTime.substring(8, 10));
      if (hour >= 0 && hour <= 4) {
        return true;
      } else if (hour >= 5 && hour <= 17) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  String getTime({int index = 0}) {
    String dateTime = weather?.timerange[index].datetime ?? "";
    if (dateTime.isNotEmpty) {
      String hour = dateTime.substring(8, 10);
      String minute = dateTime.substring(10, 12);
      return "$hour.$minute";
    } else {
      return "N/A";
    }
  }

  String getDate({int index = 0}) {
    String dateTime = weather?.timerange[index].datetime ?? "";
    if (dateTime.isNotEmpty) {
      final year = dateTime.substring(0, 4);
      final month = dateTime.substring(4, 6);
      final day = dateTime.substring(6, 8);

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
    } else {
      return "N/A";
    }
  }
}
