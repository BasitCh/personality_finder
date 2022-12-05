// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoDataAdapter extends TypeAdapter<TodoData> {
  @override
  final int typeId = 1;

  @override
  TodoData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoData(
      title: fields[0] as String,
      completed: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TodoData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.completed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
