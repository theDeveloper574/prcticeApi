// To parse this JSON data, do
//
//     final noteUpdate = noteUpdateFromJson(jsonString);

import 'dart:convert';

NoteUpdate noteUpdateFromJson(String str) => NoteUpdate.fromJson(json.decode(str));

String noteUpdateToJson(NoteUpdate data) => json.encode(data.toJson());

class NoteUpdate {
  NoteUpdate({
    this.noteId,
    this.noteTitle,
    this.noteContent,
    this.createDateTime,
    this.latestEditDateTime,
  });

  String noteId;
  String noteTitle;
  String noteContent;
  DateTime createDateTime;
  dynamic latestEditDateTime;

  factory NoteUpdate.fromJson(Map<String, dynamic> json) => NoteUpdate(
    noteId: json["noteID"],
    noteTitle: json["noteTitle"],
    noteContent: json["noteContent"],
    createDateTime: DateTime.parse(json["createDateTime"]),
    latestEditDateTime: json["latestEditDateTime"],
  );

  Map<String, dynamic> toJson() => {
    "noteID": noteId,
    "noteTitle": noteTitle,
    "noteContent": noteContent,
    "createDateTime": createDateTime.toIso8601String(),
    "latestEditDateTime": latestEditDateTime,
  };
}
