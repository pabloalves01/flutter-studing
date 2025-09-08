import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Nova Tarefa', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          // height: 650,
          // width: 375,
          // decoration: BoxDecoration(
          //   color: Colors.black12,
          //   borderRadius: BorderRadius.circular(10),
          //   border: Border.all(width: 1, color: Colors.black26),
          // ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {});
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Digite o nome',
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {});
                  },
                  controller: difficultyController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Dificuldade',
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {});
                  },
                  controller: imageController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Imagem',
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 72,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 2, color: Colors.blue),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(imageController.text, fit: BoxFit.cover),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print(nameController.text);
                  print(int.parse(difficultyController.text));
                  print(imageController.text);
                },
                child: Text('Adicionar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
