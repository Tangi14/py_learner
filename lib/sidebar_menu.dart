import 'package:flutter/material.dart';
import 'setting_screen.dart'; // Import for the settings screen

class SidebarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo[900], // Changed background to white
            ),
            child: const Text(
              'Menu',
              style: TextStyle(
                color: Colors.black, // Changed text color to black for contrast
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.black), // Changed icon color to black
            title: const Text('Notifications', style: TextStyle(color: Colors.black)), // Changed text color to black
            onTap: () {
              // Handle notification navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.black), // Changed icon color to black
            title: const Text('Settings', style: TextStyle(color: Colors.black)), // Changed text color to black
            onTap: () {
              // Navigate to SettingsScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.group, color: Colors.black), // Changed icon color to black
            title: const Text('Friends/Community', style: TextStyle(color: Colors.black)), // Changed text color to black
            onTap: () {
              // Handle friends/community navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Colors.black), // Changed icon color to black
            title: const Text('Help/Support', style: TextStyle(color: Colors.black)), // Changed text color to black
            onTap: () {
              // Handle help/support navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.emoji_events, color: Colors.black), // Changed icon color to black
            title: const Text('Achievements', style: TextStyle(color: Colors.black)), // Changed text color to black
            onTap: () {
              // Handle achievements navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback, color: Colors.black), // Changed icon color to black
            title: const Text('Feedback', style: TextStyle(color: Colors.black)), // Changed text color to black
            onTap: () {
              // Handle feedback navigation
            },
          ),
        ],
      ),
    );
  }
}
