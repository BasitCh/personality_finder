// Project imports:
import '../domain/model/todo_data.dart';

abstract class TodoDaoRepo {
  List<TodoData> getTodos();

  Future<List<TodoData>> fetchTodos();

  Future<void> saveTodo(String todo);

  Future<void> updateTodo({required int id, required bool value});
}
