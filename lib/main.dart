import 'package:flutter/material.dart';
import 'package:flutter_application_1/difficulty.dart';
import 'package:flutter_application_1/task.dart';
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
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: Duration(milliseconds: 500),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Task(
                'Teste 1',
                'https://site-inkor.s3.amazonaws.com/imagens/tinta-podium-6888fc3e372fa.png',
                1,
              ),
              Task(
                'Teste 2',
                'https://site-inkor.s3.amazonaws.com/imagens/tinta-podium-6888fc3e372fa.png',
                2,
              ),
              Task(
                'Teste 4',
                'https://site-inkor.s3.amazonaws.com/imagens/tinta-podium-6888fc3e372fa.png',
                4,
              ),
              Task(
                'Teste 5',
                'https://site-inkor.s3.amazonaws.com/imagens/tinta-podium-6888fc3e372fa.png',
                5,
              ),
              Task(
                'Teste 6',
                'https://site-inkor.s3.amazonaws.com/imagens/tinta-podium-6888fc3e372fa.png',
                3,
              ),
              Task(
                'Teste 7',
                'https://site-inkor.s3.amazonaws.com/imagens/tinta-podium-6888fc3e372fa.png',
                2,
              ),
            ],
          ),
        ),
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




