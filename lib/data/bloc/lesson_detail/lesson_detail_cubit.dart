import 'package:bloc/bloc.dart';
import 'package:learncraft/data/models/lesson_model.dart';
import 'package:learncraft/data/services/api_services.dart';
import 'package:meta/meta.dart';

part 'lesson_detail_state.dart';

class LessonDetailCubit extends Cubit<LessonDetailState> {
  final ApiServices apiServices = ApiServices();
  LessonDetailCubit() : super(LessonDetailInitial());

  Future<void> getLessonDetailByLesson(int id) async {
    // try {
    emit(LessonDetailLoading());
    List<LessonDetailModel> lessonDetails = await apiServices
        .getLessonDetailByLesson(id);
    emit(LessonDetailSuccess(lessonDetails: lessonDetails));
    // } catch (e) {
    //   emit(LessonDetailFail(message: e.toString()));
    // }
  }
}
