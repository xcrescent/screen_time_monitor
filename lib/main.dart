import 'package:flutter/material.dart';
import 'package:screen_time_monitor/screen_time_page.dart';

void main() {
  runApp(const ScreenTimeApp());
}

class ScreenTimeApp extends StatelessWidget {
  const ScreenTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screen Time Monitor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScreenTimePage(),
    );
  }
}
