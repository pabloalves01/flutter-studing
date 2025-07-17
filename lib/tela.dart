// lib/second_page.dart
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(title: const Text('Segunda Tela')),
      body: const Center(
        child: Text(
          'Você está na segunda tela! 🎉',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
