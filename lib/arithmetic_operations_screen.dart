import 'package:flutter/material.dart';

class ArithmeticOperationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arithmetic Operations'),
        backgroundColor: Colors.indigo[900],
      ),
      body: Center(
        child: const Text(
          'This is the Arithmetic Operations Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
