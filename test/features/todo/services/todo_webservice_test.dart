// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:morphosis_template/core/global/exceptions/bad_request_error.dart';
import 'package:morphosis_template/features/todo/domain/entities/todo.dart';
import 'package:morphosis_template/features/todo/services/todo_webservice.dart';

import '../../../json_reader.dart';

const URL = '/https://www.google.com/home';

class MockTodoWebService extends Mock implements TodoWebService {
  Dio dio;
  MockTodoWebService(this.dio);
  @override
  Future<List<Todo>> getTodos() async {
    final result = await dio.get<String>(URL);
    if (result.statusCode == 200) {
      final decodedData = jsonDecode(result.data!) as Map<String, dynamic>;
      final todos = decodedData['todos']
          .map<Todo>((dynamic i) => Todo.fromJson(i as Map<String, dynamic>))
          .toList() as List<Todo>;

      return todos;
    }
    throw BadRequestError(DioError(
      requestOptions: RequestOptions(path: URL),
    ));
  }
}

void main() {
  test('todo service', () async {
    final dio = Dio(BaseOptions(
      baseUrl: URL,
    ));
    final dioAdapter = DioAdapter(dio: dio);

    const path = URL;

    dioAdapter.onGet(
      path,
      (server) => server.reply(
        200,
        fixture('todos.json'),
        headers: {},
      ),
    );
    dio.interceptors.add(LogInterceptor(responseBody: true));
    final mockTodoWebService = MockTodoWebService(dio);
    await mockTodoWebService.getTodos();
  });
}
