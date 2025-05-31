import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learncraft/data/bloc/lesson/lesson_cubit.dart';
import 'package:learncraft/data/models/lesson_model.dart';
import 'package:learncraft/data/models/module_model.dart';
import 'package:learncraft/features/lesson_list/audio_lesson.dart';
import 'package:learncraft/features/lesson_list/question.dart';
import 'package:learncraft/features/lesson_list/reading_lesson.dart';

import '../lesson_list/course_detail_app_bar.dart';

class ModuleDetailsScreen extends StatefulWidget {
  const ModuleDetailsScreen({super.key, required this.module});

  final ModuleModel module;

  @override
  State<ModuleDetailsScreen> createState() => _ModuleDetailsScreenState();
}

class _ModuleDetailsScreenState extends State<ModuleDetailsScreen> {
  @override
  void initState() {
    context.read<LessonCubit>().getLessonsByModule(widget.module.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CourseDetailAppBar(module: widget.module),
      body: BlocBuilder<LessonCubit, LessonState>(
        builder: (BuildContext context, state) {
          if (state is LessonLoading) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is LessonSuccess) {
            List<LessonModel> lessons = state.lessons;
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: lessons.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final LessonModel lesson = lessons[index];
                return GestureDetector(
                  onTap: () {
                    if (lesson.questionType == 'audio') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioLesson(lesson: lesson),
                        ),
                      );
                    } else if (lesson.questionType == 'question') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuestionLesson(lesson: lesson),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReadingLesson(lesson: lesson),
                        ),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: Color(0xFFE6E6E6),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lesson.title,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          lesson.description,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          if (state is LessonFail) {
            return Text(state.message);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
