import 'package:flutter/material.dart';
import 'package:weather_app/widgets/card_weather.dart';

class ListWeather extends StatelessWidget {
  const ListWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 14,
              itemBuilder: (context, index) {
                return const CardWeather();
              })),
    );
  }
}
