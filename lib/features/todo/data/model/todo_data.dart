// Package imports:
import 'package:hive/hive.dart';

part 'todo_data.g.dart';

@HiveType(typeId: 1)
class TodoData {
  @HiveField(0)
  String title;
  @HiveField(1)
  bool completed;
  TodoData({
    required this.title,
    required this.completed,
  });
}
