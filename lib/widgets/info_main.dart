import 'package:flutter/material.dart';

import '../data/model/locations.dart';

final List<Location> location = Location.example;
final List<String> subLocation = ["a", "b", "c"];

class InfoMain extends StatefulWidget {
  const InfoMain({super.key});

  @override
  State<InfoMain> createState() => _InfoMainState();
}

class _InfoMainState extends State<InfoMain> {
  Location selectedLocation = location.first;
  String selectedSubLocation = subLocation.first;

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
              FocusManager.instance.primaryFocus?.unfocus();
            },
            items:
                location.map<DropdownMenuItem<Location>>((Location location) {
              return DropdownMenuItem<Location>(
                value: location,
                child: Text(location.name),
              );
            }).toList(),
          ),
          DropdownButton<String>(
            value: selectedSubLocation,
            onChanged: (String? newValue) {
              setState(() {
                selectedSubLocation = newValue!;
              });
              FocusManager.instance.primaryFocus?.unfocus();
            },
            items: subLocation.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "31°",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          const Text(
            "Cerah Berawan",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Text(
            "22°/31°C",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          ),
          const SizedBox(
            height: 16,
          ),
          Image.asset(
            'assets/weathers/1_cerah_day.png',
            width: 64,
            height: 64,
            filterQuality: FilterQuality.high,
          ),
        ],
      ),
    );
  }
}
