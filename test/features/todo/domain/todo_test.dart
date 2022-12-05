// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:morphosis_template/features/todo/domain/entities/todo.dart';

import '../../../json_reader.dart';

void main() {
  const tTodoModel = Todo(completed: true, title: 'first title', id: 0);

  group('Todo', () {
    test(
      'should return a valid model when the Todo.fromJson is called',
      () async {
        // arrange
        final jsonMap =
            json.decode(fixture('todo.json')) as Map<String, dynamic>;
        // act
        final result = Todo.fromJson(jsonMap);
        // assert
        expect(result, tTodoModel);
      },
    );
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tTodoModel.toJson();
        // assert
        final expectedMap = <String, dynamic>{
          'title': 'first title',
          'id': 0,
          'completed': true
        };
        expect(result, expectedMap);
      },
    );
  });
}
