import 'package:flutter/material.dart';

class IfStatementsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('If Statements'),
        backgroundColor: Colors.indigo[900],
      ),
      body: Center(
        child: const Text(
          'This is the If Statements Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
