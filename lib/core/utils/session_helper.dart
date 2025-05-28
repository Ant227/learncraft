import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class SessionHelper {
  static Future<String> getOrCreateSessionId() async {
    final box = Hive.box('userBox');
    String? sessionId = box.get('sessionId');

    if (sessionId == null) {
      sessionId = const Uuid().v4();
      await box.put('sessionId', sessionId);
    }

    return sessionId;
  }
}
