// To parse this JSON data, do
//
//     final valueCheck = valueCheckFromJson(jsonString);

import 'dart:convert';

List<ValueCheck> valueCheckFromJson(String str) => List<ValueCheck>.from(json.decode(str).map((x) => ValueCheck.fromJson(x)));

String valueCheckToJson(List<ValueCheck> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ValueCheck {
  ValueCheck({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  int userId;
  int id;
  String title;
  bool completed;

  factory ValueCheck.fromJson(Map<String, dynamic> json) => ValueCheck(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
