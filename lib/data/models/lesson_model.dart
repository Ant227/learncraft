class LessonModel {
  final int id;
  final String lessonCode;
  final String title;
  final String description;
  final int orderIndex;
  final String questionType;
  final int moduleId;

  LessonModel({
    required this.id,
    required this.lessonCode,
    required this.title,
    required this.description,
    required this.orderIndex,
    required this.questionType,
    required this.moduleId,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'],
      lessonCode: json['lessonCode'],
      title: json['title'],
      description: json['description'],
      orderIndex: json['orderIndex'],
      questionType: json['questionType'],
      moduleId: json['moduleId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'lessonCode': lessonCode,
    'title': title,
    'description': description,
    'orderIndex': orderIndex,
    'questionType': questionType,
    'moduleId': moduleId,
  };

  static List<LessonModel> fromList(List<dynamic> list) =>
      list.map((e) => LessonModel.fromJson(e)).toList();
}

class LessonDetailModel {
  final String title;
  final String description;
  final String note;
  final String audioLink;
  final int lessonId;

  LessonDetailModel({
    required this.title,
    required this.description,
    required this.note,
    required this.audioLink,
    required this.lessonId,
  });

  // fromJson method
  factory LessonDetailModel.fromJson(Map<String, dynamic> json) {
    return LessonDetailModel(
      title: json['title'],
      description: json['description'],
      note: json['note'],
      audioLink: json['audioLink'],
      lessonId: json['lessonId'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'note': note,
      'audioLink': audioLink,
      'lessonId': lessonId,
    };
  }

  // From a list of JSON objects
  static List<LessonDetailModel> fromList(List<dynamic> list) =>
      list.map((e) => LessonDetailModel.fromJson(e)).toList();
}
