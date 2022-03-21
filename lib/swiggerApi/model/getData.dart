// To parse this JSON data, do
//
//     final getDataModel = getDataModelFromJson(jsonString);

import 'dart:convert';

List<GetDataModel> getDataModelFromJson(String str) => List<GetDataModel>.from(json.decode(str).map((x) => GetDataModel.fromJson(x)));

String getDataModelToJson(List<GetDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetDataModel {
  GetDataModel({
    this.noteId,
    this.noteTitle,
    this.createDateTime,
    this.latestEditDateTime,
  });

  String noteId;
  String noteTitle;
  DateTime createDateTime;
  dynamic latestEditDateTime;

  factory GetDataModel.fromJson(Map<String, dynamic> json) => GetDataModel(
    noteId: json["noteID"],
    noteTitle: json["noteTitle"],
    createDateTime: DateTime.parse(json["createDateTime"]),
    latestEditDateTime: json["latestEditDateTime"] !=null?
    DateTime.parse(json["latestEditDateTime"]): null,
  );

  Map<String, dynamic> toJson() => {
    "noteID": noteId,
    "noteTitle": noteTitle,
    "createDateTime": createDateTime.toIso8601String(),
    "latestEditDateTime": latestEditDateTime,
  };
}
