import 'package:flutter/material.dart';

class InfoSource extends StatelessWidget {
  const InfoSource({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 55, 77, 80),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(
            color: Colors.white,
            height: 20,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(height: 16),
          Text(
            'Sumber Data:',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'BMKG (Badan Meteorologi, Klimatologi, dan Geofisika)',
            style: TextStyle(fontSize: 12, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
