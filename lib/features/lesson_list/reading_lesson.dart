import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learncraft/data/bloc/lesson_detail/lesson_detail_cubit.dart';
import 'package:learncraft/data/models/lesson_model.dart';

class ReadingLesson extends StatefulWidget {
  const ReadingLesson({
    super.key,
    required this.lesson,
  });

  final LessonModel lesson;

  @override
  State<ReadingLesson> createState() => _ReadingLessonState();
}

class _ReadingLessonState extends State<ReadingLesson> {
  @override
  void initState() {
    context.read<LessonDetailCubit>().getLessonDetailByLesson(widget.lesson.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.lesson.description,
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: BlocBuilder<LessonDetailCubit, LessonDetailState>(
        builder: (BuildContext context, state) {
          if (state is LessonDetailLoading) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is LessonDetailSuccess) {
            List<LessonDetailModel> lessonDetails = state.lessonDetails;

            if (lessonDetails.isEmpty) {
              return Center(
                child: Text(('No data yet')),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: lessonDetails.length,
              separatorBuilder: (_, __) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                final LessonDetailModel lessonDetail = lessonDetails[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1,
                      color: Color(0xFFE6E6E6),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lessonDetail.title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        lessonDetail.description,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          if (state is LessonDetailFail) {
            return Center(
              child: Text(state.message),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
