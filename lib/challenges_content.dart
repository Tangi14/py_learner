import 'package:flutter/material.dart';
import 'variables_screen.dart'; // Import the new screens
import 'arithmetic_operations_screen.dart';
import 'if_statements_screen.dart';
import 'logical_operators_screen.dart';
import 'loops_screen.dart';
import 'classes_screen.dart';

class ChallengesContent extends StatelessWidget {
  // List of challenge titles and the corresponding navigation targets
  final List<Map<String, dynamic>> challenges = [
    {'title': 'Variables', 'screen': VariablesScreen()},
    {'title': 'Arithmetic Operations', 'screen': ArithmeticOperationsScreen()},
    {'title': 'If Statements', 'screen': IfStatementsScreen()},
    {'title': 'Logical Operators', 'screen': LogicalOperatorsScreen()},
    {'title': 'Different Types of Loops', 'screen': LoopsScreen()},
    {'title': 'Classes', 'screen': ClassesScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Challenges',
          style: TextStyle(color: Colors.white), // White color for the title
        ),
        backgroundColor: Colors.indigo[900], // Custom app bar color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20), // Spacing before grid

            // Grid of Challenge Buttons
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: challenges.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two buttons per row
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2,
              ),
              itemBuilder: (context, index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent, // Blue color for the buttons
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to the corresponding screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => challenges[index]['screen'],
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      challenges[index]['title'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
