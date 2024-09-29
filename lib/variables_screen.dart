import 'package:flutter/material.dart';

class VariablesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Variables'),
        backgroundColor: Colors.indigo[900],
      ),
      body: Center(
        child: const Text(
          'This is the Variables Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
