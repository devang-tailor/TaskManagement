class Task {
  int id;
  String title;
  String? description;
  bool isCompleted;

  Task({required this.id, required this.title, this.description, required this.isCompleted});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted'] == 1, // Convert int to bool
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0, // Convert bool to int
    };
  }

  Task copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}