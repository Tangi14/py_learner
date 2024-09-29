import 'package:flutter/material.dart';

class LoopsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Different Types of Loops'),
        backgroundColor: Colors.indigo[900],
      ),
      body: Center(
        child: const Text(
          'This is the Different Types of Loops Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
