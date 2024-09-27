import 'package:flutter/material.dart';
import 'home_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900], // Dark blue background color
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.white), // Set title color to white
        ),
        backgroundColor: Colors.indigo[900], // Dark blue for AppBar
        iconTheme: const IconThemeData(color: Colors.white), // Set back arrow color to white
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20), // Space from top

            // Full Name Field
            const TextField(
              style: TextStyle(color: Colors.black), // Black text color for input
              decoration: InputDecoration(
                labelText: 'Full Name',
                labelStyle: TextStyle(color: Colors.black), // Black label text
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20), // Space between fields

            // Username Field
            const TextField(
              style: TextStyle(color: Colors.black), // Black text color for input
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.black), // Black label text
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20), // Space between fields

            // Email Address Field
            const TextField(
              style: TextStyle(color: Colors.black), // Black text color for input
              decoration: InputDecoration(
                labelText: 'Email Address',
                labelStyle: TextStyle(color: Colors.black), // Black label text
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20), // Space between fields

            // Password Field
            const TextField(
              obscureText: true, // Hide text input for password
              style: TextStyle(color: Colors.black), // Black text color for input
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black), // Black label text
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20), // Space between fields

            // Confirm Password Field
            const TextField(
              obscureText: true, // Hide text input for password confirmation
              style: TextStyle(color: Colors.black), // Black text color for input
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: TextStyle(color: Colors.black), // Black label text
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40), // Space between fields and button

            // Sign Up Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to HomeScreen when "Sign Up" is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()), // Updated class name
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
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Button text color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
