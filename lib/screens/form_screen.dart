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
                  controller: difficultyController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                    setState(() {}); // Necessário apenas aqui para atualizar preview da imagem
                  },
                  controller: imageController,
                  keyboardType: TextInputType.url,
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
                  child: imageController.text.isNotEmpty
                      ? Image.network(
                          imageController.text,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error, color: Colors.white);
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        )
                      : Icon(Icons.image, color: Colors.white),
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
