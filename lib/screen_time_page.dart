import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_builder/timer_builder.dart';

class ScreenTimePage extends StatefulWidget {
  const ScreenTimePage({super.key});

  @override
  State<ScreenTimePage> createState() => _ScreenTimePageState();
}

class _ScreenTimePageState extends State<ScreenTimePage> {
  late SharedPreferences _prefs;
  int _screenTime = 0; // in seconds

  @override
  void initState() {
    super.initState();
    _initScreenTime();

    PeriodicTimer(
      const Duration(seconds: 1),
      _updateScreenTime,
    );
  }

  Future<void> PeriodicTimer(Duration duration, void Function() callback) async {
    Timer(duration, () {
      callback();
      PeriodicTimer(duration, callback);
    });
  }

  void _initScreenTime() async {
    _prefs = await SharedPreferences.getInstance();
    _screenTime = _prefs.getInt('screen_time') ?? 0;
  }

  void _updateScreenTime() {
    int currentTime = _prefs.getInt('screen_time') ?? 0;
    _prefs.setInt('screen_time', currentTime + 1);
    setState(() {
      _screenTime = currentTime + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Time Monitor'),
      ),
      body: Center(
        child: TimerBuilder.periodic(const Duration(seconds: 1), builder: (context) {
          return Text(
            'Screen Time: ${_screenTime.toString()} seconds',
            style: const TextStyle(fontSize: 20),
          );
        }),
      ),
    );
  }
}
