import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Task('Teste 1', 'assets/images/tinta-podium.png', 1),
            Task('Teste 2', 'assets/images/tinta-podium.png', 2),
            Task('Teste 4', 'assets/images/tinta-podium.png', 4),
            Task('Teste 5', 'assets/images/tinta-podium.png', 5),
            Task('Teste 6', 'assets/images/tinta-podium.png', 3),
            Task('Teste 7', 'assets/images/tinta-podium.png', 2),
            SizedBox(height: 80),
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
    );
  }
}
