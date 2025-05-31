part of 'lesson_cubit.dart';

@immutable
sealed class LessonState {}

final class LessonInitial extends LessonState {}

final class LessonLoading extends LessonState {}

final class LessonSuccess extends LessonState {
  final List<LessonModel> lessons;
  LessonSuccess({required this.lessons});
}

final class LessonFail extends LessonState {
  final String message;
  LessonFail({required this.message});
}
