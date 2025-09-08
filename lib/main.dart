import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/form_screen.dart';
import 'package:flutter_application_1/screens/initial_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: InitialScreen(),
      home: FormScreen(),
    );
  }
}
