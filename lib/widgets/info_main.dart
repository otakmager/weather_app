import 'package:flutter/material.dart';

class InfoMain extends StatefulWidget {
  const InfoMain({super.key});

  @override
  State<InfoMain> createState() => _InfoMainState();
}

class _InfoMainState extends State<InfoMain> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //dropdown menu
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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          const SizedBox(
            height: 16,
          ),
          Image.asset(
            'assets/weather/1_cerah_day.png',
            width: 64,
            height: 64,
            filterQuality: FilterQuality.high,
          ),
        ],
      ),
    );
  }
}
