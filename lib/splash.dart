import 'package:flutter/material.dart';
import 'package:py_learner/getstarted.dart'; // Import the GetStartedScreen

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    // Wait for 1.5 seconds before navigating
    await Future.delayed(const Duration(milliseconds: 1500), () {
      // Navigate to the GetStartedScreen and replace the Splash screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GetStarted()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigo[900], // Dark blue background color
        child: Center(
          child: Column(
            children: [
              const Spacer(), // Pushes the content below it downwards
              const Text(
                'Learn Python',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color
                ),
              ),
              const SizedBox(height: 20), // Space between the text and the logo
              Image.asset(
                'assets/images/python_logo.png', // Python logo asset path
                width: 150, // Set the width of the logo
                height: 150, // Set the height of the logo
              ),
              const Spacer(), // Pushes the content above it upwards
            ],
          ),
        ),
      ),
    );
  }
}
