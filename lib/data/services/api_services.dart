import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learncraft/data/models/lesson_model.dart';
import 'package:learncraft/data/models/module_model.dart';

class ApiServices {
  final String baseUrl =
      "https://learncraft-backend-production.up.railway.app/api";
  Future<List<ModuleModel>> getModules() async {
    final url = Uri.parse('$baseUrl/modules');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // print('Fetched modules: ${response.body}');
      return ModuleModel.fromList(jsonDecode(response.body));
    } else {
      // print('Failed to load modules: ${response.statusCode}');
      throw 'Failed to load modules';
    }
  }

  Future<List<LessonModel>> getLessonsByModule(int id) async {
    final url = Uri.parse('$baseUrl/lessons/module/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return LessonModel.fromList(jsonDecode(response.body));
    } else {
      throw 'Failed to load lessons';
    }
  }

  Future<List<LessonDetailModel>> getLessonDetailByLesson(int id) async {
    final url = Uri.parse('$baseUrl/lesson-details/lesson/$id');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return LessonDetailModel.fromList(jsonDecode(response.body));
    } else {
      throw 'Failed to load lesson details';
    }
  }
}
