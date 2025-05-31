part of 'lesson_detail_cubit.dart';

@immutable
sealed class LessonDetailState {}

final class LessonDetailInitial extends LessonDetailState {}

final class LessonDetailLoading extends LessonDetailState {}

final class LessonDetailSuccess extends LessonDetailState {
  final List<LessonDetailModel> lessonDetails;
  LessonDetailSuccess({required this.lessonDetails});
}

final class LessonDetailFail extends LessonDetailState {
  final String message;
  LessonDetailFail({required this.message});
}
