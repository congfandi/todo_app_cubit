class Todo {
  Todo({
      this.id, 
      this.title, 
      this.description, 
      this.createdAt, 
      this.updatedAt, 
      this.isDone,});

  Todo.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isDone = json['isDone'];
  }
  String? id;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;
  bool? isDone;
Todo copyWith({  String? id,
  String? title,
  String? description,
  String? createdAt,
  String? updatedAt,
  bool? isDone,
}) => Todo(  id: id ?? this.id,
  title: title ?? this.title,
  description: description ?? this.description,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  isDone: isDone ?? this.isDone,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['isDone'] = isDone;
    return map;
  }

}