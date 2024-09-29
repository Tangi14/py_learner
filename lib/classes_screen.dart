import 'package:flutter/material.dart';

class ClassesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classes'),
        backgroundColor: Colors.indigo[900],
      ),
      body: Center(
        child: const Text(
          'This is the Classes Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
