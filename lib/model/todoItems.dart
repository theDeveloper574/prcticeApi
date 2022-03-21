// To parse this JSON data, do
//
//     final todoItems = todoItemsFromJson(jsonString);

import 'dart:convert';

List<TodoItems> todoItemsFromJson(String str) => List<TodoItems>.from(json.decode(str).map((x) => TodoItems.fromJson(x)));

String todoItemsToJson(List<TodoItems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoItems {
  TodoItems({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  int postId;
  int id;
  String name;
  String email;
  String body;

  factory TodoItems.fromJson(Map<String, dynamic> json) => TodoItems(
    postId: json["postId"],
    id: json["id"],
    name: json["name"],
    email: json["email"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "id": id,
    "name": name,
    "email": email,
    "body": body,
  };
}
