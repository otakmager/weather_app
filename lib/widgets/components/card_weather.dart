import 'package:flutter/material.dart';

import '../../data/model/parameter_weather.dart';
import '../../utils/get_wind_direction.dart';

class CardWeather extends StatefulWidget {
  final int index;
  final ParameterWeather parameterWeather;
  const CardWeather(
      {super.key, required this.index, required this.parameterWeather});

  @override
  State<CardWeather> createState() => _CardWeatherState();
}

class _CardWeatherState extends State<CardWeather> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.parameterWeather.getDate(index: widget.index),
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            Text(
              '${widget.parameterWeather.getTime(index: widget.index)} WIB',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Image.asset(
              widget.parameterWeather.getAssetWeather(
                  index: widget.index,
                  isNight:
                      widget.parameterWeather.isNight(index: widget.index)),
              width: 48,
              height: 48,
              filterQuality: FilterQuality.high,
            ),
            const SizedBox(height: 16),
            Text(
              widget.parameterWeather.getInfoWeather(index: widget.index),
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              '${widget.parameterWeather.getTemperature(index: widget.index)}°C',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/info_weather/humidity.png',
                  width: 14,
                  height: 14,
                  filterQuality: FilterQuality.high,
                ),
                const SizedBox(width: 8),
                Text(
                  '${widget.parameterWeather.getHumidity(index: widget.index)}%',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 11),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/info_weather/wind.png',
                  width: 14,
                  height: 14,
                  filterQuality: FilterQuality.high,
                ),
                const SizedBox(width: 8),
                Text(
                  '${widget.parameterWeather.getWindSpeed(index: widget.index)} km/jam',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 11),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/info_weather/compass.png',
                  width: 14,
                  height: 14,
                  filterQuality: FilterQuality.high,
                ),
                const SizedBox(width: 8),
                Text(
                  getWindDirectionInIndonesia(widget.parameterWeather
                      .getWindDirection(index: widget.index)),
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 11),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
