import 'package:flutter/material.dart';

class LogicalOperatorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logical Operators'),
        backgroundColor: Colors.indigo[900],
      ),
      body: Center(
        child: const Text(
          'This is the Logical Operators Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
