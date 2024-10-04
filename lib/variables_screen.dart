import 'package:flutter/material.dart';

class VariablesScreen extends StatefulWidget {
  @override
  _VariablesScreenState createState() => _VariablesScreenState();
}

class _VariablesScreenState extends State<VariablesScreen> {
  int _currentIndex = 0;

  // List to hold the draggable pieces of code
  List<String> dragItems = ['my_name', '=', '"John"', 'print(my_name)'];

  // Target list to receive dropped items
  List<String> droppedItems = [];

  // Function to reset drag-and-drop state
  void _resetQuiz() {
    setState(() {
      droppedItems = [];
      dragItems = ['my_name', '=', '"John"', 'print(my_name)'];
    });
  }

  // Method to check if the dropped items form the correct sequence
  void _checkAnswer() {
    if (droppedItems.join(' ') == 'my_name = "John" print(my_name)') {
      _showDialog('Correct!', 'You successfully constructed the variable declaration and output.');
    } else {
      _showDialog('Try Again', 'The pieces of code are not in the correct order.');
    }
  }

  // Function to show a dialog with a message
  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetQuiz(); // Reset quiz after closing dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Function to move to the next section
  void _nextSection() {
    setState(() {
      if (_currentIndex < _sections.length - 1) {
        _currentIndex++;
      }
    });
  }

  // Widget for draggable items (box style)
  Widget _draggableBox(String text, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  // List of sections
  final List<Widget> _sections = [];

  @override
  void initState() {
    super.initState();
    _sections.addAll([
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
      // Drag and Drop Quiz Section
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Exercise: Drag and Drop Quiz',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Drag the pieces of code below to create a variable called `my_name` and assign it your name. Then, print the value of `my_name`.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          // Draggable items (source)
          Builder(
            builder: (context) {
              return Wrap(
                spacing: 10,
                children: List.generate(dragItems.length, (index) {
                  return Draggable<String>(
                    data: dragItems[index],
                    child: _draggableBox(dragItems[index], Colors.indigo),
                    feedback: _draggableBox(dragItems[index], Colors.indigo.withOpacity(0.5)),
                    childWhenDragging: _draggableBox(dragItems[index], Colors.grey),
                  );
                }),
              );
            },
          ),
          const SizedBox(height: 20),
          // Drag Target (destination)
          DragTarget<String>(
            builder: (context, candidateData, rejectedData) {
              return Container(
                height: 150,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: droppedItems.map((item) {
                    return Text(
                      item,
                      style: const TextStyle(fontFamily: 'monospace', fontSize: 16),
                    );
                  }).toList(),
                ),
              );
            },
            onAccept: (data) {
              setState(() {
                if (!droppedItems.contains(data)) {
                  droppedItems.add(data);
                  dragItems.remove(data);
                }
              });
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _checkAnswer,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo[900]),
            child: const Text(
              'Check Answer',
              style: TextStyle(color: Colors.white, fontSize: 18),
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
    ]);
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
