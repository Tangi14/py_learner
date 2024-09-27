import 'package:flutter/material.dart';

// No need to import SettingsScreen again here as you're already in it

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsToggle = true;
  bool _appNotificationsToggle = true;
  bool _dataSyncToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.indigo[900],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo[900],
              ),
              child: const Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer, user can go back to Home
                Navigator.pop(context); // Go back to HomeScreen
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Stay on the same page, just close the drawer
                Navigator.pop(context);
              },
            ),
            // Add other items in the sidebar here...
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Account Section
              ExpansionTile(
                title: const Text(
                  'Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                children: [
                  ListTile(
                    title: const Text('Edit Profile'),
                    onTap: () {
                      // Navigate to edit profile screen
                    },
                  ),
                  ListTile(
                    title: const Text('Change Password'),
                    onTap: () {
                      // Navigate to change password screen
                    },
                  ),
                  ListTile(
                    title: const Text('Privacy'),
                    onTap: () {
                      // Navigate to privacy settings
                    },
                  ),
                ],
              ),
              const Divider(),

              // Notification Section
              ExpansionTile(
                title: const Text(
                  'Notification',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                children: [
                  SwitchListTile(
                    title: const Text('Notifications'),
                    value: _notificationsToggle,
                    onChanged: (bool value) {
                      setState(() {
                        _notificationsToggle = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('App Notifications'),
                    value: _appNotificationsToggle,
                    onChanged: (bool value) {
                      setState(() {
                        _appNotificationsToggle = value;
                      });
                    },
                  ),
                ],
              ),
              const Divider(),

              // Data and Storage Section
              ExpansionTile(
                title: const Text(
                  'Data and Storage',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                children: [
                  SwitchListTile(
                    title: const Text('Data Sync'),
                    value: _dataSyncToggle,
                    onChanged: (bool value) {
                      setState(() {
                        _dataSyncToggle = value;
                      });
                    },
                  ),
                ],
              ),
              const Divider(),

              // More Section
              ExpansionTile(
                title: const Text(
                  'More',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                children: [
                  ListTile(
                    title: const Text('Language'),
                    onTap: () {
                      // Navigate to language settings
                    },
                  ),
                  ListTile(
                    title: const Text('Country'),
                    onTap: () {
                      // Navigate to country settings
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
