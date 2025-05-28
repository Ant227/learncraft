// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_progress.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionProgressAdapter extends TypeAdapter<SessionProgress> {
  @override
  final int typeId = 0;

  @override
  SessionProgress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SessionProgress(
      sessionId: fields[0] as String,
      lessonId: fields[1] as String,
      completedAt: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SessionProgress obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.sessionId)
      ..writeByte(1)
      ..write(obj.lessonId)
      ..writeByte(2)
      ..write(obj.completedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionProgressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
