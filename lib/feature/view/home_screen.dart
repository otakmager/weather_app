import 'package:flutter/material.dart';

import '../../widgets/info_source.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Weather App'),
        SizedBox(height: 20),
        Text('Welcome to the Weather App'),
        InfoSource()
      ],
    );
  }
}
