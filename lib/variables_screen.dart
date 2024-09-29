import 'package:flutter/material.dart';

class VariablesScreen extends StatefulWidget {
  @override
  _VariablesScreenState createState() => _VariablesScreenState();
}

class _VariablesScreenState extends State<VariablesScreen> {
  // Index to track which section to show
  int _currentIndex = 0;

  // List of sections/titles
  final List<Widget> _sections = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Introduction to Variables',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'A variable in programming is used to store data that can be used later in the program. '
          'It acts like a container or box that holds information such as numbers, text, or other types of data.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Key Concepts:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          '1. **Declaration**: Creating a variable by giving it a name and specifying the type of data it will store.\n'
          '2. **Assignment**: Storing a value inside the variable using the assignment operator `=`.\n'
          '3. **Accessing**: Reading the value stored in the variable for calculations or displaying it.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Example in Python:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            '''# Declaring and assigning a variable
name = "Alice"  # String variable
age = 25        # Integer variable

# Accessing and printing the values
print(name)     # Output: Alice
print(age)      # Output: 25''',
            style: TextStyle(fontFamily: 'monospace', fontSize: 16),
          ),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Common Data Types:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          '- **String**: Stores text (e.g., "Hello")\n'
          '- **Integer**: Stores whole numbers (e.g., 25)\n'
          '- **Float**: Stores decimal numbers (e.g., 3.14)\n'
          '- **Boolean**: Stores true or false values (e.g., True, False)',
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Exercise: Assign Your Name',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Create a variable called `my_name` and assign it your name. Then, print the value of `my_name`.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            '''# Example:
my_name = "John"
print(my_name)  # Output: John''',
            style: TextStyle(fontFamily: 'monospace', fontSize: 16),
          ),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Conclusion:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Variables are fundamental to programming and are used to store data that your programs will use. '
          'Mastering variables will help you understand how to manage data in your code effectively.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
  ];

  // Function to move to the next section
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
        title: const Text('Variables'),
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
                onPressed: _nextSection, // Update the section on press
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
