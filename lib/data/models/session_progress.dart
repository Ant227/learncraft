import 'package:hive/hive.dart';
part 'session_progress.g.dart';

@HiveType(typeId: 0)
class SessionProgress extends HiveObject {
  @HiveField(0)
  String sessionId;

  @HiveField(1)
  String lessonId;

  @HiveField(2)
  DateTime completedAt;

  SessionProgress({
    required this.sessionId,
    required this.lessonId,
    required this.completedAt,
  });
}
