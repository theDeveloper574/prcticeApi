


// To parse this JSON data, do
//
//     final userCreate = userCreateFromJson(jsonString);

import 'dart:convert';

UserCreate userCreateFromJson(String str) => UserCreate.fromJson(json.decode(str));

String userCreateToJson(UserCreate data) => json.encode(data.toJson());

class UserCreate {
  UserCreate({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  String name;
  String job;
  String id;
  DateTime createdAt;

  factory UserCreate.fromJson(Map<String, dynamic> json) => UserCreate(
    name: json["name"],
    job: json["job"],
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
    "id": id,
    "createdAt": createdAt.toIso8601String(),
  };
}
