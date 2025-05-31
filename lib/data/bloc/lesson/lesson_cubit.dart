import 'package:bloc/bloc.dart';
import 'package:learncraft/data/models/lesson_model.dart';
import 'package:learncraft/data/services/api_services.dart';
import 'package:meta/meta.dart';

part 'lesson_state.dart';

class LessonCubit extends Cubit<LessonState> {
  final ApiServices apiServices = ApiServices();
  LessonCubit() : super(LessonInitial());

  Future<void> getLessonsByModule(int id) async {
    try {
      emit(LessonLoading());
      List<LessonModel> lessons = await apiServices.getLessonsByModule(id);
      emit(LessonSuccess(lessons: lessons));
    } catch (e) {
      emit(LessonFail(message: e.toString()));
    }
  }
}
