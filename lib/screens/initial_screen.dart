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
    return AnimatedOpacity(
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
    );
  }
}
