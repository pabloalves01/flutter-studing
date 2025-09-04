import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/difficulty.dart';
import 'package:flutter_application_1/components/task.dart';
import 'package:flutter_application_1/screens/initial_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Tarefas', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black87,
        ),
        body: InitialScreen(),
        floatingActionButton: FloatingActionButton(
          child: Icon(opacidade ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              opacidade = !opacidade;
            });
          },
        ),
      ),
    );
  }
}
