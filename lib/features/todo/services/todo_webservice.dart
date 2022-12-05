// Package imports:
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:
import '../domain/entities/todo.dart';
import 'todo_service.dart';

part 'todo_webservice.g.dart';

@dev
@prod
@Singleton(as: TodoService)
@RestApi(baseUrl: '')
abstract class TodoWebService extends TodoService {
  @factoryMethod
  factory TodoWebService(Dio dio) = _TodoWebService;

  @override
  @GET('/home')
  Future<List<Todo>> getTodos();
}
