part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}
class GetTodoList extends TodoEvent {
  const GetTodoList();

  @override
  List<Object> get props => [];
}

class AddOrUpdateTodo extends TodoEvent {
  final Todo todo;

  const AddOrUpdateTodo(
    this.todo,
  );

  @override
  List<Object> get props => [];
}

class DeleteTodo extends TodoEvent {
  final String todoId;

  const DeleteTodo(this.todoId);

  @override
  List<Object> get props => [todoId];
}