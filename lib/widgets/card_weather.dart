import 'package:flutter/material.dart';

import '../utils/get_weather.dart';
import '../utils/get_wind_direction.dart';

class CardWeather extends StatelessWidget {
  const CardWeather({super.key});

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
            const Text(
              '01.00 WIB',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            ),
            const SizedBox(height: 16),
            Image.asset(
              getWeatherAssets(0),
              width: 32,
              height: 32,
              filterQuality: FilterQuality.high,
            ),
            const SizedBox(height: 16),
            Text(
              getWeather(0),
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              '31° C',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/info_weather/humidity.png',
                  width: 12,
                  height: 12,
                  filterQuality: FilterQuality.high,
                ),
                const SizedBox(width: 8),
                const Text(
                  '87%',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/info_weather/wind.png',
                  width: 12,
                  height: 12,
                  filterQuality: FilterQuality.high,
                ),
                const SizedBox(width: 8),
                const Text(
                  '12.5 km/jam',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/info_weather/compass.png',
                  width: 12,
                  height: 12,
                  filterQuality: FilterQuality.high,
                ),
                const SizedBox(width: 8),
                Text(
                  getWindDirectionInIndonesia("NE"),
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 11),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
