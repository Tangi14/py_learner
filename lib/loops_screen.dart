import 'package:flutter/material.dart';

class LoopsScreen extends StatefulWidget {
  @override
  _LoopsScreenState createState() => _LoopsScreenState();
}

class _LoopsScreenState extends State<LoopsScreen> {
  int _currentIndex = 0;

  final List<Widget> _sections = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Introduction to Loops',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        const SizedBox(height: 10),
        const Text(
          'Loops are used to execute a block of code repeatedly, either a set number of times or until a condition is met. The two main types of loops are for-loops and while-loops.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Types of Loops:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        const SizedBox(height: 10),
        const Text(
          '- **For Loop**: Executes a block of code a specified number of times.\n- **While Loop**: Repeats a block of code while a condition is true.',
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
            '''# For Loop example
for i in range(5):
    print(i)  # Output: 0, 1, 2, 3, 4

# While Loop example
x = 5
while x > 0:
    print(x)
    x -= 1  # Output: 5, 4, 3, 2, 1''',
            style: TextStyle(fontFamily: 'monospace', fontSize: 16),
          ),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Exercise: Using Loops',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        const SizedBox(height: 10),
        const Text(
          'Write a program that prints numbers from 1 to 10 using a for loop and a while loop.',
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
          'Loops are powerful tools in programming, allowing you to automate repetitive tasks. Understanding loops is key to solving many problems efficiently.',
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
        title: const Text('Different Types of Loops'),
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
