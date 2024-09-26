import 'package:flutter/material.dart';
import 'package:py_learner/splash.dart';
import 'package:py_learner/getstarted.dart'; // Import the GetStartedScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Py Learner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash(), // Set the initial screen to the Splash screen
    );
  }
}
