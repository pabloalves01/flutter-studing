import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/components/task.dart';
import 'package:flutter_application_1/data/task_dao.dart';
import 'package:flutter_application_1/screens/initial_screen.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  // fica de olho quando as informacoes (validacoes) sao preenchidas atravez do formstate do formulario que envolve os textformfield
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white,
            icon: Icon(Icons.arrow_back),
          ),
          title: const Text(
            'Nova Tarefa',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black87,
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Container(
              // height: 650,
              // width: 375,
              // decoration: BoxDecoration(
              //   color: Colors.black12,
              //   borderRadius: BorderRadius.circular(10),
              //   border: Border.all(width: 1, color: Colors.black26),
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      controller: nameController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Nome não pode ser vazio';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
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
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) < 1 ||
                            int.parse(value) > 5) {
                          return 'Dificuldade deve ser entre 1 e 5';
                        }
                        return null;
                      },
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
                        setState(
                          () {},
                        ); // Necessário apenas aqui para atualizar preview da imagem
                      },
                      controller: imageController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Imagem não pode ser vazia';
                        }
                        return null;
                      },
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
                              errorBuilder:
                                  (
                                    BuildContext context,
                                    Object expection,
                                    StackTrace? stackTrace,
                                  ) {
                                    return Icon(
                                      Icons.error,
                                      color: Colors.white,
                                    );
                                  },
                              // errorBuilder: (context, error, stackTrace) {
                              //   return Icon(Icons.error, color: Colors.white);
                              // },
                              // loadingBuilder: (context, child, loadingProgress) {
                              //   if (loadingProgress == null) return child;
                              //   return Center(
                              //     child: CircularProgressIndicator(
                              //       value: loadingProgress.expectedTotalBytes != null
                              //           ? loadingProgress.cumulativeBytesLoaded /
                              //               loadingProgress.expectedTotalBytes!
                              //           : null,
                              //     ),
                              //   );
                              // },
                            )
                          : Icon(Icons.image, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        TaskDao().save(
                          Task(
                            nameController.text,
                            imageController.text,
                            int.parse(difficultyController.text),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Tarefa adicionada com sucesso'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InitialScreen(),
                          ),
                        );
                      } else {
                        print('Formulario não validado');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Formulario não validado'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Text('Adicionar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
