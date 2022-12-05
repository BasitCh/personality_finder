// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import '../../../../core/global/error/network_exceptions.dart';
import '../../../../core/global/exceptions/localized_error.dart';
import '../../../../core/global/util/logging/logging.dart';
import '../../data/todo_repo.dart';
import '../../domain/entities/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepo todoRepository;
  TodoBloc({required this.todoRepository}) : super(TodoInitial()) {
    on<GetTodoList>((event, emit) async {
      emit(const TodoIsLoading());
      try {
        //  final data = await todoRepository.fetchTodos() ?? [];
        final data = <Todo>[];
        if (data.isNotEmpty) {
          emit(TodoSuccess(data: data));
        } else {
          emit(TodoInitial());
        }
      } on DioError catch (e) {
        logger.error(e.toString(), error: e);
        if (e is LocalizedError) {
          emit(TodoFailure(e.message));
        } else {
          final error = NetworkExceptions.getDioException(e);
          final message = NetworkExceptions.getErrorMessage(error!);
          emit(TodoFailure(message));
        }
      }
    });
    on<AddOrUpdateTodo>((event, emit) {
      // TODO: implement event handler
    });
    on<DeleteTodo>((event, emit) {
      // TODO: implement event handler
    });
  }
}
