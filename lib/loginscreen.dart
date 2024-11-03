import 'package:flutter/material.dart';
import 'package:py_learner/home_screen.dart'; // Import the HomeScreen
import 'package:py_learner/signup_screen.dart'; // Import the SignupScreen
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers for input fields
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to verify user credentials and sign in
  Future<void> signIn() async {
    try {
      // Check if a user with the given username exists
      QuerySnapshot userSnapshot = await _firestore
          .collection('users')
          .where('username', isEqualTo: usernameController.text.trim())
          .get();

      if (userSnapshot.docs.isNotEmpty) {
        // Get the user's email from Firestore
        String email = userSnapshot.docs.first['email'];

        // Authenticate using Firebase Auth with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: passwordController.text.trim(),
        );

        // Navigate to HomeScreen if authentication is successful
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        // Show error if username does not exist
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Username not found')),
        );
      }
    } catch (e) {
      // Display error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900], // Dark blue background color
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60), // Space from the top

            // Python Logo
            Image.asset(
              'assets/images/python_logo.png', // Python logo asset path
              width: 150,
              height: 150,
            ),

            const SizedBox(height: 40), // Space between logo and text fields

            // Username Input Field
            TextField(
              controller: usernameController,
              style: const TextStyle(color: Colors.white), // White text color
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: const TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20), // Space between fields

            // Password Input Field
            TextField(
              controller: passwordController,
              obscureText: true, // Hide password input
              style: const TextStyle(color: Colors.white), // White text color
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 40), // Space between password and button

            // Sign In Button
            ElevatedButton(
              onPressed: signIn,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            const Spacer(), // Pushes content upward for better alignment

            // Sign Up Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    // Navigate to the sign-up screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(), // Navigate to SignupScreen
                      ),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20), // Space for balance
          ],
        ),
      ),
    );
  }
}
