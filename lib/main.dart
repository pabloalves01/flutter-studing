import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(color: Colors.red, width: 100.0, height: 100.0),
                Container(color: Colors.blue, width: 50.0, height: 50.0),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(color: Colors.blue, width: 100.0, height: 100.0),
                Container(color: Colors.red, width: 50.0, height: 50.0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(color: Colors.cyan, width: 50.0, height: 50.0),
                Container(color: Colors.pinkAccent, width: 50.0, height: 50.0),
                Container(color: Colors.purple, width: 50.0, height: 50.0),
              ],
            ),
            Container(
              color: Colors.amber,
              width: 300.0,
              height: 30.0,
              child: Text(
                'Diamante Amarelo',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
