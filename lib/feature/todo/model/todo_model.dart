class TaskModel {
  String? id;
  String? title;
  String? description;

  TaskModel({
    this.id,
    this.title,
    this.description,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json, String id) {
    return TaskModel(
      id: id,
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
    };
  }
}
