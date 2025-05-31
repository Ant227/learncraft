part of 'module_cubit.dart';

@immutable
sealed class ModuleState {}

final class ModuleInitial extends ModuleState {}

final class ModuleLoading extends ModuleState {}

final class ModuleSuccess extends ModuleState {
  final List<ModuleModel> modules;
  ModuleSuccess({required this.modules});
}

final class ModuleFail extends ModuleState {
  final String message;
  ModuleFail({required this.message});
}
