import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learncraft/features/home/landing_page.dart';

import 'data/models/session_progress.dart';
import 'features/lesson_list/life_lessons_page.dart';
import 'features/lesson_list/literacy_lessons_page.dart';
import 'features/lesson_list/numeracy_lessons_page.dart';
import 'features/lesson_list/thai_lessons_page.dart';
import 'features/modules/module_selection_page.dart';

// (Later: import ModuleSelectionPage here when you build it)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(SessionProgressAdapter());
  await Hive.openBox<SessionProgress>('progressBox');
  await Hive.openBox('userBox');

  runApp(const LearnCraftApp());
}

class LearnCraftApp extends StatelessWidget {
  const LearnCraftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LearnCraft',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF5C4DFF),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/modules': (context) => const ModuleSelectionPage(),
        '/literacy': (context) => const LiteracyLessonsPage(),
        '/numeracy': (context) => const NumeracyLessonsPage(),
        '/thai': (context) => const ThaiLessonsPage(),
        '/life': (context) => const LifeLessonsPage(),
      },
    );
  }
}
