import 'package:flutter/material.dart';

class ArithmeticOperationsScreen extends StatefulWidget {
  @override
  _ArithmeticOperationsScreenState createState() => _ArithmeticOperationsScreenState();
}

class _ArithmeticOperationsScreenState extends State<ArithmeticOperationsScreen> {
  int _currentIndex = 0;

  final List<Widget> _sections = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Introduction to Arithmetic Operations',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        const SizedBox(height: 10),
        const Text(
          'Arithmetic operations in programming involve basic mathematical operations like addition, subtraction, multiplication, and division.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Basic Operations:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        const SizedBox(height: 10),
        const Text(
          '- **Addition**: `+`\n- **Subtraction**: `-`\n- **Multiplication**: `*`\n- **Division**: `/`\n- **Modulus**: `%`',
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
            '''# Arithmetic operations
a = 10
b = 5

print(a + b)  # Output: 15
print(a - b)  # Output: 5
print(a * b)  # Output: 50
print(a / b)  # Output: 2.0''',
            style: TextStyle(fontFamily: 'monospace', fontSize: 16),
          ),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Exercise: Basic Operations',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        const SizedBox(height: 10),
        const Text(
          'Perform addition, subtraction, multiplication, and division between two numbers.',
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
          'Understanding arithmetic operations is crucial for solving mathematical problems in programming.',
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
        title: const Text('Arithmetic Operations'),
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
