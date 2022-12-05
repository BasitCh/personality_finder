part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
  
  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoSuccess extends TodoState {
  final List<Todo> data;

  const TodoSuccess({required this.data});
}

class TodoIsLoading extends TodoState {
  const TodoIsLoading();
}

class TodoFailure extends TodoState {
  final String failure;

  const TodoFailure(this.failure);
}

class TodoUpdate extends TodoState {
  final Todo updatedTodo;

  const TodoUpdate({required this.updatedTodo});
}

