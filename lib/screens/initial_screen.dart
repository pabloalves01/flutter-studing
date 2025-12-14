import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/task.dart';
import 'package:flutter_application_1/data/task_dao.dart';
import 'package:flutter_application_1/screens/form_screen.dart';

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
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh),
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(opacidade ? Icons.visibility : Icons.visibility_off),
            color: Colors.white,
            onPressed: () {
              setState(() {
                opacidade = !opacidade;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8.0, bottom: 70.0),
        child: FutureBuilder<List<Task>>(
          future: TaskDao().findAll(),
          builder: (context, snapshot) {
            List<Task>? items = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text('Carregando...'),
                    ],
                  ),
                );
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text('Carregando...'),
                    ],
                  ),
                );
              case ConnectionState.active:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text('Carregando...'),
                    ],
                  ),
                );
              case ConnectionState.done:
                if (snapshot.hasData && items != null) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Task task = items[index];
                        return task;
                      },
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error_outline, size: 32),
                          Text('Não há tarefas para visualizar'),
                        ],
                      ),
                    );
                  }
                }
                return Text('Ocorreu um erro desconhecido.');
            }
          },
        ),
      ),
      // body: AnimatedOpacity(
      //   opacity: opacidade ? 1 : 0,
      //   duration: Duration(milliseconds: 500),
      //   child: ListView(
      //     scrollDirection: Axis.vertical,
      //     children: [
      //       Task('Teste 1', 'assets/images/tinta-podium.png', 1),
      //       Task('Teste 2', 'assets/images/tinta-podium.png', 2),
      //       Task('Teste 4', 'assets/images/tinta-podium.png', 4),
      //       Task('Teste 5', 'assets/images/tinta-podium.png', 5),
      //       Task('Teste 6', 'assets/images/tinta-podium.png', 3),
      //       Task('Teste 7', 'assets/images/tinta-podium.png', 2),
      //       SizedBox(height: 80),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormScreen()),
          ).then(
            (value) => setState(() {
              print('Recarregando a tela::');
            }),
          );
        },
      ),
    );
  }
}
