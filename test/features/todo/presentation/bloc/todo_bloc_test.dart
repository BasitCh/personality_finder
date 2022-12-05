// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:morphosis_template/features/todo/data/todo_repo.dart';
import 'package:morphosis_template/features/todo/domain/entities/todo.dart';
import 'package:morphosis_template/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:morphosis_template/features/todo/services/todo_service.dart';

const todos = [
  Todo(completed: true, title: 'first todo', id: 1),
  Todo(completed: true, title: 'second todo', id: 2),
  Todo(completed: true, title: 'third todo', id: 3),
];

class MockTodoRepo extends Mock implements TodoRepo {
  late TodoService todoService;
  late bool isEmpty;
  late bool hasError;
  MockTodoRepo(
      {required this.todoService,
      required this.isEmpty,
      required this.hasError});

  @override
  List<Todo> getTodos() {
    if (hasError) {
      throw DioError(requestOptions: RequestOptions(path: 'www.google.com'));
    }
    return isEmpty ? [] : todos;
  }

  @override
  Future<List<Todo>> fetchTodos() {
    return Future.value(getTodos());
  }
}

class MockTodoService extends Mock implements TodoService {
  MockTodoService();

  @override
  Future<List<Todo>> getTodos() {
    return Future.value(todos);
  }
}

void main() {
  group('todo bloc test when todo is not empty', () {
    late MockTodoRepo todoRepository;
    late MockTodoService todoService;
    late TodoBloc todoBloc;
    setUp(() {
      todoService = MockTodoService();
      todoRepository = MockTodoRepo(
          todoService: todoService, isEmpty: false, hasError: false);
      todoBloc = TodoBloc(todoRepository: todoRepository);
    });

    blocTest<TodoBloc, TodoState>(
      'emits [TodoIsLoading, TodoSuccess,] states for'
      '_mapTodosGetFromRepo if todo is not empty',
      build: () => todoBloc,
      act: (bloc) => bloc.add(const GetTodoList()),
      expect: () {
        return [const TodoIsLoading(), const TodoSuccess(data: todos)];
      },
    );

    tearDown(() {
      todoBloc.close();
    });
  });

  group('todo bloc when todo is empty', () {
    late MockTodoRepo todoRepository;
    late MockTodoService todoService;
    late TodoBloc todoBloc;
    setUp(() {
      todoService = MockTodoService();
      todoRepository = MockTodoRepo(
          todoService: todoService, isEmpty: true, hasError: false);
      todoBloc = TodoBloc(todoRepository: todoRepository);
    });

    blocTest<TodoBloc, TodoState>(
      'emits [TodoIsLoading, TodoSuccess,] states for'
      '_mapTodosGetFromRepo if todo is empty',
      build: () => todoBloc,
      act: (bloc) => bloc.add(const GetTodoList()),
      expect: () {
        return [const TodoIsLoading(), TodoInitial()];
      },
    );
  });

  group('todo bloc when error occured', () {
    late MockTodoRepo todoRepository;
    late MockTodoService todoService;
    late TodoBloc todoBloc;
    setUp(() {
      todoService = MockTodoService();
      todoRepository =
          MockTodoRepo(todoService: todoService, isEmpty: true, hasError: true);
      todoBloc = TodoBloc(todoRepository: todoRepository);
    });

    blocTest<TodoBloc, TodoState>(
      'emits [TodoIsLoading, TodoSuccess,] states for'
      '_mapTodosGetFromRepo if todo is empty',
      build: () => todoBloc,
      act: (bloc) => bloc.add(const GetTodoList()),
      expect: () {
        return [const TodoIsLoading(), const TodoFailure('Error occured')];
      },
    );
  });
}
