import 'package:flutter/material.dart';
import 'setting_screen.dart'; 
import 'profile_content.dart'; 
import 'challenges_content.dart'; 
import 'leaderboard_content.dart'; 
import 'rewards_content.dart'; 
import 'sidebar_menu.dart'; // Import SidebarMenu

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    ChallengesContent(), 
    LeaderboardContent(), 
    ProfileContent(),     
    RewardsContent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.indigo[900],
      ),
      drawer: SidebarMenu(), // Use the SidebarMenu widget
      body: _pages[_currentIndex], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Challenges',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Rewards',
          ),
        ],
      ),
    );
  }
}

// Content for the Home tab
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Profile Section
          Card(
            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/avatar.png'), // Placeholder image
              ),
              title: const Text('John Doe'),
              subtitle: const Text('Level 5 - Python Expert'),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // Navigate to profile editing screen
                },
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Progress Tracker
          const Text(
            'Progress Tracker',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: 0.7, // Example progress
            backgroundColor: Colors.white24,
            color: Colors.blueAccent,
          ),
          const SizedBox(height: 20),

          // Daily Challenges Section
          Card(
            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Daily Challenges',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    title: const Text('Complete 3 Python exercises'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Go to challenge
                      },
                      child: const Text('Start'),
                    ),
                  ),
                  ListTile(
                    title: const Text('Solve an algorithm problem'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Go to challenge
                      },
                      child: const Text('Start'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Leaderboard Section
          Card(
            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Leaderboard',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const CircleAvatar(backgroundColor: Colors.green, child: Text('1')),
                    title: const Text('User123'),
                    trailing: const Text('2000 XP'),
                  ),
                  ListTile(
                    leading: const CircleAvatar(backgroundColor: Colors.green, child: Text('2')),
                    title: const Text('JaneDoe'),
                    trailing: const Text('1900 XP'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Rewards and Badges Section
          const Text(
            'Rewards & Badges',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: List.generate(6, (index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(Icons.star, color: Colors.white),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
