import 'package:flutter/material.dart';

class ArithmeticOperationsScreen extends StatefulWidget {
  @override
  _ArithmeticOperationsScreenState createState() =>
      _ArithmeticOperationsScreenState();
}

class _ArithmeticOperationsScreenState
    extends State<ArithmeticOperationsScreen> {
  int _currentIndex = 0;

  // List of draggable items for the quiz
  List<String> dragItems = ['x', '=', '5 + 3', 'print(x)'];
  List<String> droppedItems = [];

  // Function to reset the quiz
  void _resetQuiz() {
    setState(() {
      droppedItems = [];
      dragItems = ['x', '=', '5 + 3', 'print(x)'];
    });
  }

  // Function to check if the dropped items form the correct sequence
  void _checkAnswer() {
    if (droppedItems.join(' ') == 'x = 5 + 3 print(x)') {
      _showDialog('Correct!', 'You successfully constructed the arithmetic operation.');
    } else {
      _showDialog('Try Again', 'The pieces of code are not in the correct order.');
    }
  }

  // Function to show a dialog message
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
                _resetQuiz(); // Reset the quiz after closing the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Widget to create draggable boxes for the quiz
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

  // List of sections including introduction, examples, and quiz
  List<Widget> _sections() {
    return [
      // Introduction Section
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Introduction to Arithmetic Operations',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Arithmetic operations in programming include addition (+), subtraction (-), multiplication (*), and division (/). '
            'These operators allow us to perform calculations on numbers.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),

      // Examples Section
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Examples of Arithmetic Operations',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '1. **Addition**: `5 + 3` results in `8`.\n'
            '2. **Subtraction**: `10 - 2` results in `8`.\n'
            '3. **Multiplication**: `4 * 3` results in `12`.\n'
            '4. **Division**: `8 / 2` results in `4`.',
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
            'Drag the pieces of code below to create a variable `x` that stores the result of adding 5 and 3. '
            'Then, print the value of `x`.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            children: List.generate(dragItems.length, (index) {
              return Draggable<String>(
                data: dragItems[index],
                child: _draggableBox(dragItems[index], Colors.indigo),
                feedback: _draggableBox(
                    dragItems[index], Colors.indigo.withOpacity(0.5)),
                childWhenDragging: _draggableBox(dragItems[index], Colors.grey),
              );
            }),
          ),
          const SizedBox(height: 20),
          DragTarget<String>(
            builder: (context, candidateData, rejectedData) {
              return Container(
                height: 150,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Wrap(
                  children: droppedItems.map((item) {
                    return Text(
                      item,
                      style: const TextStyle(
                          fontFamily: 'monospace', fontSize: 16),
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
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo[900]),
            child: const Text(
              'Check Answer',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    ];
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
            _sections()[_currentIndex], // Display the current section
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[900],
                ),
                onPressed: () {
                  setState(() {
                    _currentIndex = (_currentIndex + 1) % _sections().length;
                  });
                },
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
