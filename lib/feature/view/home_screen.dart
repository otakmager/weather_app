import 'package:flutter/material.dart';

import '../../widgets/info_main.dart';
import '../../widgets/info_source.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InfoMain(),
          SizedBox(height: 8),
          Text('Welcome to the Weather App'),
          InfoSource()
        ],
      ),
    ));
  }
}
