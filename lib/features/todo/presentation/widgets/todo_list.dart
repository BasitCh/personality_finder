// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../data/todo_dao_impl.dart';
import '../../domain/model/todo_data.dart';
import 'todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoDaoRepo = TodoDaoRepository();
    return FutureBuilder(
      future: todoDaoRepo.fetchTodos(),
      // ignore: avoid_types_on_closure_parameters
      builder: (context, AsyncSnapshot<List<TodoData>> snap) {
        if (snap.hasData) {
          return ListView.builder(
              itemCount: snap.data!.length,
              itemBuilder: (context, index) {
                final todoData = snap.data![index];
                return TodoItem(
                  title: todoData.title,
                  subtitle: todoData.title,
                  status: todoData.completed,
                );
              });
        } else {
          return const CircularProgressIndicator.adaptive();
        }
      },
    );
  }
}
