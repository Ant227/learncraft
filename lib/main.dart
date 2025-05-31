import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learncraft/data/bloc/lesson/lesson_cubit.dart';
import 'package:learncraft/data/bloc/lesson_detail/lesson_detail_cubit.dart';
import 'package:learncraft/data/bloc/module/module_cubit.dart';
import 'package:learncraft/features/lesson_list/audio_lesson.dart';

import 'data/models/session_progress.dart';
import 'features/modules/module_selection_page.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ModuleCubit()),
        BlocProvider(create: (context) => LessonCubit()),
        BlocProvider(create: (context) => LessonDetailCubit()),
      ],
      child: MaterialApp(
        title: 'LearnCraft',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Montserrat',
          useMaterial3: true,
          colorSchemeSeed: const Color(0xFF5C4DFF),
          appBarTheme: AppBarTheme(
            color: Colors.white,
          ),
        ),
        home: ModuleSelectionPage(),
      ),
    );
  }
}
