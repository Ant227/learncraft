import 'package:hive/hive.dart';
import '../models/session_progress.dart';

class LocalProgressService {
  final _box = Hive.box<SessionProgress>('progressBox');

  Future<void> saveProgress(SessionProgress progress) async {
    await _box.add(progress);
  }

  List<SessionProgress> getProgressBySession(String sessionId) {
    return _box.values.where((p) => p.sessionId == sessionId).toList();
  }
}
