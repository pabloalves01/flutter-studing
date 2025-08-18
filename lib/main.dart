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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tarefas', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black87,
        ),
        body: Container(
          margin: EdgeInsetsGeometry.all(16.0),
          child: Stack(
            children: [
              Container(color: Colors.blue, height: 140.0),
              Container(
                color: Colors.white,
                height: 100.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(color: Colors.black26, width: 72, height: 100),
                    Text('Aprender Flutter'),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.arrow_drop_up),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}
