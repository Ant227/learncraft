class ModuleModel {
  final int? id;
  final String title;
  final String description;
  final String color;
  final String status;
  final String textColor;
  final String border;
  final String image;

  ModuleModel({
    this.id,
    required this.title,
    required this.description,
    required this.color,
    required this.status,
    required this.textColor,
    required this.border,
    required this.image,
  });

  factory ModuleModel.fromMap(Map<String, dynamic> map) {
    return ModuleModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      color: map['color'],
      status: map['status'],
      textColor: map['textColor'],
      border: map['border'],
      image: map['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'color': color,
      'status': status,
      'text_color': textColor,
      'border': border,
      'image': image,
    };
  }

  /// Convert a list of maps to a list of LiteracySkill objects
  static List<ModuleModel> fromList(List<dynamic> list) {
    return list.map((map) => ModuleModel.fromMap(map)).toList();
  }
}
