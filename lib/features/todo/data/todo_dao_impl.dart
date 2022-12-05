// Package imports:
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import '../domain/model/todo_data.dart';
import 'todo_dao.dart';

class TodoDaoRepository extends TodoDaoRepo {
  final box = Hive.box<TodoData>('todoTest');

  @override
  Future<List<TodoData>> fetchTodos() {
    final todoList = <TodoData>[];

    final todoData = box.keys;

    for (var i = 0; i < todoData.length; i++) {
      final data = box.getAt(i);
      todoList.add(data!);
    }

    return Future.value(todoList);
  }

  @override
  List<TodoData> getTodos() {
    return [];
  }

  @override
  Future<void> saveTodo(String todo) async {
    await box.add(TodoData(title: todo, completed: false));
  }

  @override
  Future<void> updateTodo({required int id, required bool value}) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
