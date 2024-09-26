import 'package:flutter/material.dart';
import 'onboardingscreen.dart'; // Import the OnboardingScreen

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigo[900], // Dark blue background color
        child: Center(
          child: Column(
            children: [
              const Spacer(), // Pushes the content below it downwards

              // "Get Started with Python" text above the logo
              const Text(
                'Get Started with Python',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color
                ),
              ),
              const SizedBox(height: 20), // Space between the text and logo
              
              // Python logo
              Image.asset(
                'assets/images/python_logo.png', // Python logo asset path
                width: 150, // Set the width of the logo
                height: 150, // Set the height of the logo
              ),

              const Spacer(), // Pushes the content above it upwards

              const SizedBox(height: 40), // Space between the logo and button
              
              // Get Started button
              ElevatedButton(
                onPressed: () {
                  // Navigate to OnboardingScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OnboardingScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.blueAccent, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Button text color
                  ),
                ),
              ),
              const SizedBox(height: 40), // Extra space at the bottom for balance
            ],
          ),
        ),
      ),
    );
  }
}
