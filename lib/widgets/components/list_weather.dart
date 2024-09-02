import 'package:flutter/material.dart';

import '../../data/model/parameter_weather.dart';
import '../../data/model/weather.dart';
import '../../utils/get_specific_parameter.dart';
import 'card_weather.dart';

class ListWeather extends StatefulWidget {
  final Area area;
  const ListWeather({super.key, required this.area});

  @override
  State<ListWeather> createState() => _ListWeatherState();
}

class _ListWeatherState extends State<ListWeather> {
  @override
  Widget build(BuildContext context) {
    ParameterWeather parameterWeather = getParameterWeather(widget.area);
    int length = parameterWeather.weather!.timerange.length;
    return SizedBox(
      height: 320,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: length,
              itemBuilder: (context, index) {
                return CardWeather(
                  index: index,
                  parameterWeather: parameterWeather,
                );
              })),
    );
  }
}
