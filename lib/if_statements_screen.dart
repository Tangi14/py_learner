import 'package:flutter/material.dart';

class IfStatementsScreen extends StatefulWidget {
  @override
  _IfStatementsScreenState createState() => _IfStatementsScreenState();
}

class _IfStatementsScreenState extends State<IfStatementsScreen> {
  int _currentIndex = 0;

  List<String> dragItems = ['if', '(x > 5)', '{', 'print("x is greater than 5");', '}'];
  List<String> droppedItems = [];

  void _resetQuiz() {
    setState(() {
      droppedItems = [];
      dragItems = ['if', '(x > 5)', '{', 'print("x is greater than 5");', '}'];
    });
  }

  void _checkAnswer() {
    if (droppedItems.join(' ') == 'if (x > 5) { print("x is greater than 5"); }') {
      _showDialog('Correct!', 'You successfully constructed the if statement.');
    } else {
      _showDialog('Try Again', 'The pieces of code are not in the correct order.');
    }
  }

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
                _resetQuiz();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

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

  List<Widget> _sections() {
    return [
      // Introduction
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Introduction to If Statements',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'If statements allow you to execute a block of code only if a certain condition is true.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),

      // Examples
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Examples of If Statements',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Example:\n\n'
            '```dart\n'
            'int x = 6;\n'
            'if (x > 5) {\n'
            '  print("x is greater than 5");\n'
            '}\n'
            '```',
            style: TextStyle(fontSize: 16, fontFamily: 'monospace'),
          ),
        ],
      ),

      // Quiz
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
            'Drag the pieces of code to form an if statement that checks if `x > 5` and prints a message.',
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
        title: const Text('If Statements'),
        backgroundColor: Colors.indigo[900],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sections()[_currentIndex],
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
