// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../../core/global/const.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo extends Equatable {
  @JsonKey(name: 'title', required: true)
  final String title;
  @JsonKey(name: 'completed', required: true)
  final bool completed;
  @JsonKey(name: 'id')
  final int? id;

  const Todo({
    required this.title,
    required this.completed,
    this.id,
  });

  factory Todo.fromJson(Json json) => _$TodoFromJson(json);

  Json toJson() => _$TodoToJson(this);

  @override
  List<Object?> get props => [title, completed, id];
}
