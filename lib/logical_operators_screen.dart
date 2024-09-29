import 'package:flutter/material.dart';

class LogicalOperatorsScreen extends StatefulWidget {
  @override
  _LogicalOperatorsScreenState createState() => _LogicalOperatorsScreenState();
}

class _LogicalOperatorsScreenState extends State<LogicalOperatorsScreen> {
  int _currentIndex = 0;

  final List<Widget> _sections = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Introduction to Logical Operators',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        const SizedBox(height: 10),
        const Text(
          'Logical operators are used to combine conditional statements. The most common logical operators are AND, OR, and NOT.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Basic Logical Operators:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        const SizedBox(height: 10),
        const Text(
          '- **AND**: Returns true if both conditions are true.\n- **OR**: Returns true if at least one condition is true.\n- **NOT**: Reverses the result of a condition.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Example in Python:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            '''# Logical Operators example
a = True
b = False

print(a and b)  # Output: False
print(a or b)   # Output: True
print(not a)    # Output: False''',
            style: TextStyle(fontFamily: 'monospace', fontSize: 16),
          ),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Exercise: Combine Conditions',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        const SizedBox(height: 10),
        const Text(
          'Write a Python program that uses logical operators to check if a number is both positive and even.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Conclusion:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        const SizedBox(height: 10),
        const Text(
          'Logical operators are essential for making more complex decisions in your programs. They help combine multiple conditions in a meaningful way.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
  ];

  void _nextSection() {
    setState(() {
      if (_currentIndex < _sections.length - 1) {
        _currentIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logical Operators'),
        backgroundColor: Colors.indigo[900],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sections[_currentIndex], // Display current section
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[900], // Button color
                ),
                onPressed: _nextSection,
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
