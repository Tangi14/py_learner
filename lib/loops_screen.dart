import 'package:flutter/material.dart';

class LoopsScreen extends StatefulWidget {
  @override
  _LoopsScreenState createState() => _LoopsScreenState();
}

class _LoopsScreenState extends State<LoopsScreen> {
  int _currentIndex = 0;

  List<String> dragItems = ['for', '(int i = 0; i < 5; i++)', '{', 'print(i);', '}'];
  List<String> droppedItems = [];

  void _resetQuiz() {
    setState(() {
      droppedItems = [];
      dragItems = ['for', '(int i = 0; i < 5; i++)', '{', 'print(i);', '}'];
    });
  }

  void _checkAnswer() {
    if (droppedItems.join(' ') == 'for (int i = 0; i < 5; i++) { print(i); }') {
      _showDialog('Correct!', 'You successfully constructed the for loop.');
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
            'Introduction to Loops',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Loops allow you to repeat a block of code multiple times. Common types of loops are:\n'
            '- `for` loop\n'
            '- `while` loop\n'
            '- `do-while` loop',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),

      // Examples
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Examples of Loops',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Example of a `for` loop:\n\n'
            '```dart\n'
            'for (int i = 0; i < 5; i++) {\n'
            '  print(i);\n'
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
            'Drag the pieces of code to form a for loop that prints numbers from 0 to 4.',
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
        title: const Text('Loops'),
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
