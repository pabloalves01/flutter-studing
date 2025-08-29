import 'package:flutter/material.dart';

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
                'Teste 1 Teste 1 Teste 1 Teste 1',
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

class Task extends StatefulWidget {
  final String nome;
  final String imagemUrl;
  final int dificuldade;
  const Task(this.nome, this.imagemUrl, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0; //
  // nao pode ser variavel do tipo final, pq ela tem que começar com 0;
  // tem q ser acima do override pq quando ele recria ele sobrescreve se tiver em baixo, e volta pro zero
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.blue,
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                ),
                height: 100.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.network(widget.imagemUrl),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: (widget.dificuldade >= 1
                                    ? Colors.blue
                                    : Colors.blue[100]),
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: (widget.dificuldade >= 2
                                    ? Colors.blue
                                    : Colors.blue[100]),
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: (widget.dificuldade >= 3
                                    ? Colors.blue
                                    : Colors.blue[100]),
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: (widget.dificuldade >= 4
                                    ? Colors.blue
                                    : Colors.blue[100]),
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: (widget.dificuldade >= 4
                                    ? Colors.blue
                                    : Colors.blue[100]),
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: (widget.dificuldade >= 5
                                    ? Colors.blue
                                    : Colors.blue[100]),
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            nivel++;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_drop_up, color: Colors.white),
                            Text('UP', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      width: 200,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.indigo,
                        value: (widget.dificuldade > 0)
                            ? (nivel / widget.dificuldade) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Nivel: $nivel',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
