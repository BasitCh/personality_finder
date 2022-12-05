// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:morphosis_template/features/todo/data/todo_repo_impl.dart';
import 'package:morphosis_template/features/todo/domain/entities/todo.dart';
import 'package:morphosis_template/features/todo/services/todo_webservice.dart';

import '../services/todo_webservice_test.dart';

@GenerateMocks([TodoRepository, TodoWebService])
void main() {
  group('Todo repository', () {
    TodoRepository? todoRepository;
    TodoWebService? todoWebService;
    setUp(() {
      todoWebService = MockTodoWebService(Dio());
      todoRepository = TodoRepository(todoWebService!);
    });
    test('should get todo items when from todo service', () async {
      // arrange

      when(todoWebService!.getTodos()).thenAnswer((realInvocation) async => []);

      // act
      final result = todoRepository!.getTodos();

      expect(result, <Todo>[]);
    });
  });
}
