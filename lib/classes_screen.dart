import 'package:flutter/material.dart';

class ClassesScreen extends StatefulWidget {
  @override
  _ClassesScreenState createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
  int _currentIndex = 0;

  final List<Widget> _sections = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Introduction to Classes',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        const SizedBox(height: 10),
        const Text(
          'Classes are a fundamental part of object-oriented programming (OOP). They allow you to define your own data types and associated functions (methods).',
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Basic Structure of a Class:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        const SizedBox(height: 10),
        const Text(
          'class ClassName:\n    def __init__(self, attributes):\n        # Initialize the object\n    def method(self):\n        # Define a method',
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
            '''# Class example in Python
class Dog:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def bark(self):
        print(f"{self.name} says woof!")

# Create an object of class Dog
dog = Dog("Buddy", 3)
dog.bark()  # Output: Buddy says woof!''',
            style: TextStyle(fontFamily: 'monospace', fontSize: 16),
          ),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Exercise: Create a Class',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        const SizedBox(height: 10),
        const Text(
          'Write a class `Car` that has attributes like `make` and `model`, and methods that describe the car.',
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
          'Classes are the foundation of object-oriented programming, allowing you to structure your code in an organized way. Mastering classes is essential for building complex applications.',
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
        title: const Text('Classes'),
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
