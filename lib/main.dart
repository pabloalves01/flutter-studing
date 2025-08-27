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
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Task('Teste 1'),
            Task('Teste 2'),
            Task('Teste 3'),
            Task('Teste 4'),
            Task('Teste 5'),
            Task('Teste 6'),
            Task('Teste 7'),
            Task('Teste'),
            Task('testsdsds e'),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}

class Task extends StatelessWidget {
  final String nome;
  const Task(this.nome, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
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
                Text(nome),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_drop_up),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
