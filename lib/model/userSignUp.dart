
// To parse this JSON data, do
//
//     final userSignUp = userSignUpFromJson(jsonString);

import 'dart:convert';

UserSignUp userSignUpFromJson(String str) => UserSignUp.fromJson(json.decode(str));

String userSignUpToJson(UserSignUp data) => json.encode(data.toJson());

class UserSignUp {
  UserSignUp({
    this.id,
    this.token,
  });

  int id;
  String token;

  factory UserSignUp.fromJson(Map<String, dynamic> json) => UserSignUp(
    id: json["id"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "token": token,
  };
}
