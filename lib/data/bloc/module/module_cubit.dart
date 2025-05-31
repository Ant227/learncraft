import 'package:bloc/bloc.dart';
import 'package:learncraft/data/models/module_model.dart';
import 'package:learncraft/data/services/api_services.dart';
import 'package:meta/meta.dart';

part 'module_state.dart';

class ModuleCubit extends Cubit<ModuleState> {
  ApiServices apiServices = ApiServices();
  ModuleCubit() : super(ModuleInitial());

  Future<void> getModules() async {
    try {
      emit(ModuleLoading());
      List<ModuleModel> modules = await apiServices.getModules();
      emit(ModuleSuccess(modules: modules));
    } catch (e) {
      emit(ModuleFail(message: e.toString()));
    }
  }
}
