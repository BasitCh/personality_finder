// Project imports:
import '../domain/entities/todo.dart';

// ignore: one_member_abstracts
abstract class TodoService {
  Future<List<Todo>> getTodos();
}
