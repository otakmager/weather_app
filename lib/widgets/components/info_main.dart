import 'package:flutter/material.dart';

import '../../data/model/locations.dart';
import '../../data/model/parameter_weather.dart';

class InfoMain extends StatefulWidget {
  final bool isNight;
  final String date;
  final List<Location> locations;
  final List<City> cities;
  final ParameterWeather parameterWeather;
  final int indexSelectedProv;
  final void Function(int) setIndexSelectedProv;
  final void Function(int) setIndexSelectedCity;
  final void Function(String) getNewCity;
  const InfoMain({
    super.key,
    required this.isNight,
    required this.date,
    required this.locations,
    required this.cities,
    required this.indexSelectedProv,
    required this.parameterWeather,
    required this.setIndexSelectedProv,
    required this.setIndexSelectedCity,
    required this.getNewCity,
  });

  @override
  State<InfoMain> createState() => _InfoMainState();
}

class _InfoMainState extends State<InfoMain> {
  late Location selectedLocation;
  late City selectedCity;

  @override
  void initState() {
    super.initState();
    selectedLocation = widget.locations[widget.indexSelectedProv];
    selectedCity = widget.cities.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DropdownButton<Location>(
            value: selectedLocation,
            onChanged: (Location? newValue) {
              setState(() {
                selectedLocation = newValue!;
              });
              widget.getNewCity(selectedLocation.id);
              widget.setIndexSelectedProv(
                  widget.locations.indexOf(selectedLocation));
              FocusManager.instance.primaryFocus?.unfocus();
            },
            items: widget.locations
                .map<DropdownMenuItem<Location>>((Location location) {
              return DropdownMenuItem<Location>(
                value: location,
                child: Text(location.name),
              );
            }).toList(),
          ),
          DropdownButton<City>(
            value: selectedCity,
            onChanged: (City? newValue) {
              setState(() {
                selectedCity = newValue!;
              });
              widget.setIndexSelectedCity(selectedCity.index);
              FocusManager.instance.primaryFocus?.unfocus();
            },
            items: widget.cities.map<DropdownMenuItem<City>>((City city) {
              return DropdownMenuItem<City>(
                  value: city, child: Text(city.name));
            }).toList(),
          ),
          const SizedBox(
            height: 64,
          ),
          Text(
            widget.date,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "${widget.parameterWeather.getTemperature()}°",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            textAlign: TextAlign.center,
          ),
          Text(
            widget.parameterWeather.getInfoWeather(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          Text(
            "${widget.parameterWeather.getMinMaxTemperature()}C",
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Image.asset(
            widget.parameterWeather.getAssetWeather(isNight: widget.isNight),
            width: 128,
            height: 128,
            filterQuality: FilterQuality.high,
          ),
        ],
      ),
    );
  }
}
