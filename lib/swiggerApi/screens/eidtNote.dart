import 'dart:convert';

import 'package:apis/swiggerApi/model/noteUpdate.dart';
import 'package:apis/swiggerApi/screens/getNoteFromService.dart';
import 'package:apis/swiggerApi/screens/getScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditNote extends StatefulWidget {
  String noteId;
  EditNote({this.noteId});
  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController name1 = TextEditingController();
  TextEditingController name2 = TextEditingController();
  NoteUpdate _noteUpdate;
  // CreateNote _createNote;
  Future<NoteUpdate> getData(String id) async {
    final url = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app/notes/' + id;
    final header = {"apiKey": "16dbf33d-09bf-4e79-81f3-be46506b7493"};
    final response = await http.get(Uri.parse(url), headers: header);
    if (response.statusCode == 200) {
      print(response.body);
      return noteUpdateFromJson(response.body);
    } else {
      print('no data coming');
    }
  }

  // Future<CreateNote> UpdateNote(String id, String title, String content) async {
  //   // final url = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app/notes/'+id;
  //   // // Map<String, dynamic> headers = {
  //   // //   'apiKey': '16dbf33d-09bf-4e79-81f3-be46506b7493',
  //   // //   'content-Type': 'application/json'
  //   // // };
  //   // // final msg = jsonEncode({"noteTitle": title, "noteContent": content});
  //   // final response = await http.put(Uri.parse(url), headers: {
  //   //   'apiKey': '16dbf33d-09bf-4e79-81f3-be46506b7493',
  //   //   'content-Type': 'application/json'
  //   // }, body: {
  //   //   json.encode({
  //   //     'noteTitle': noteTitle,
  //   //     'noteContent': noteContent,
  //   //   }),
  //   // });
  //   // if(response.statusCode == 204){
  //   //   final jsonData = jsonDecode(response.body);
  //   //   print(jsonData);
  //   // }else{
  //   //   print("no data coming");
  //   // }
  // }

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    getData(widget.noteId).then((value) {
      setState(() {
        _noteUpdate = value;
        isLoading = false;
      });
      name1.text = _noteUpdate.noteTitle;
      name2.text = _noteUpdate.noteContent;
    });
  }
  var result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.noteId == null ? 'create note' : "Update Note"),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => GetScreen()));
              },
              child: Icon(Icons.add))
        ],
      ),
      body: Container(
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: name1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: name2,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          primary: Colors.white,
                        ),
                        onPressed: () async {
                          // final note =CreateNote(
                          //   noteTitle: noteTitle.text,
                          //   noteContent: noteContent.text
                          // );
                         // result = await ServiceNote.getData(widget.noteId,note).then((value){
                         //   setState(() {
                         //     result =value;
                         //   });
                         // });
                         //  String title = noteTitle.text.toString();
                         //  String content = noteContent.text.toString();
                         //  final url = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app/notes/';
                         //  Map<String, dynamic> headers = {
                         //    'apiKey': '16dbf33d-09bf-4e79-81f3-be46506b7493',
                         //    'content-Type': 'application/json'
                         //  };
                         //  final msg = jsonEncode({"noteTitle": title, "noteContent": content});
                         //  final response = await http.put(Uri.parse(url), headers: {
                         //    'apiKey': '16dbf33d-09bf-4e79-81f3-be46506b7493',
                         //    'content-Type': 'application/json'
                         //  }, body: {
                         //    json.encode({
                         //      'noteTitle': title,
                         //      'noteContent': content,
                         //    }),
                         //  });
                         //  if(response.statusCode == 200){
                         //    final jsonData = jsonDecode(response.body);
                         //    print(jsonData);
                         //  }else{
                         //    print("no data coming");
                         //  }
                         //  print("helk");
                          String title = name1.text.trim();
                          String content = name2.text.trim();
                          updateUserData(title, content, widget.noteId).then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>GetScreen()));
                          });
                        },
                        child: Text("Submit")),
                  )
                ],
              ),
      ),
    );
  }
  Future updateUserData(String title,String content,String id)async{
    final String url = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app/notes/$id';
    print(url);
    final msg = jsonEncode({"noteTitle": title,
      "noteContent": content});
    final response = await http.put(Uri.parse(url),headers: {
      'apiKey': '16dbf33d-09bf-4e79-81f3-be46506b7493',
      'content-Type': 'application/json'
      // 'content-type': 'application/x-www-form-urlencoded',
      // 'content-type': 'application/problem+json',
    },body: msg);
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      return jsonData;
    }else{
      print(response.statusCode);
      print(response.request);
      print(response.headers);
      print('error');
    }
  }
}
