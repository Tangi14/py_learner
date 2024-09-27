import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User's profile picture
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/avatar.png'), // Placeholder image
          ),
          const SizedBox(height: 20),

          // User's name and username
          const Text(
            'John Doe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            '@johndoe',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 10),

          // User's gender
          const Text(
            'Gender: Male',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),

          // Level indicator
          const Text(
            'Level: 5',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),

          // Edit profile button
          ElevatedButton(
            onPressed: () {
              // Handle profile editing here
            },
            child: const Text('Edit Profile'),
          ),
          const SizedBox(height: 20),

          // Additional user info can go here
          const Text(
            'Bio: Passionate about coding and technology.',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
