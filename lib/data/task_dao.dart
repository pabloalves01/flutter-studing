import 'package:flutter_application_1/components/task.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static String tableSql =
      'CREATE TABLE $_tableName($_name TEXT, $_difficulty INTEGER, $_image TEXT)';

  static String _tableName = 'tasks';
  static String _name = 'name';
  static String _difficulty = 'difficulty';
  static String _image = 'image';

  /// Salva uma tarefa no banco de dados
  ///
  /// [task] - A tarefa a ser salva
  save(Task task) async {
    print('Iniciando salvamento');
    final Database db = await getDatabase();
    Map<String, dynamic> taskMap = toMap(task);

    var taskExists = await find(task.nome);
    if (taskExists.isEmpty) {
      print('Tarefa não existe, criando:::');
      return await db.insert(_tableName, taskMap);
    } else {
      print('Tarefa existe, atualizando:::');
      return await db.update(
        _tableName,
        taskMap,
        where: '$_name = ?',
        whereArgs: [task.nome],
      );
    }
  }

  /// Encontra todas as tarefas no banco de dados
  ///
  /// Retorna uma lista de tarefas
  Future<List<Task>> findAll() async {
    print('Encontrando todas as tarefas no banco de dados');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    print('Tarefas encontradas: $result');
    return toList(result);
  }

  /// Converte uma lista de mapas para uma lista de tarefas
  ///
  /// [tasksMap] - A lista de mapas a ser convertida
  ///
  /// Retorna uma lista de tarefas
  List<Task> toList(List<Map<String, dynamic>> tasksMap) {
    print('Convertendo lista de mapas para lista de tarefas');
    final List<Task> tasks = [];
    for (Map<String, dynamic> task in tasksMap) {
      final Task tarefa = Task(task[_name], task[_image], task[_difficulty]);
      tasks.add(tarefa);
    }
    print('Tarefas convertidas: $tasks');
    return tasks;
  }

  Map<String, dynamic> toMap(Task task) {
    print('Convertendo tarefa para Map::');
    final Map<String, dynamic> map = {}; // ou Map();
    map[_name] = task.nome;
    map[_difficulty] = task.dificuldade;
    map[_image] = task.imagemUrl;

    print('Mapa de tarefas é:: $map');
    return map;
  }

  /// Encontra uma tarefa no banco de dados
  ///
  /// [taskName] - O nome da tarefa a ser encontrada
  ///
  /// Retorna uma lista de tarefas
  Future<List<Task>> find(String taskName) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [taskName],
    );
    print('Tarefa encontrada::: ${toList(result)}');
    return toList(result);
  }

  /// Deleta uma tarefa no banco de dados
  ///
  /// [taskName] - O nome da tarefa a ser deletada
  delete(String taskName) async {
    print('Deletando tarefa $_name');
    final Database db = await getDatabase();
    return db.delete(_tableName, where: '$_name', whereArgs: [taskName]);
  }
}
