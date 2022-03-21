



import 'dart:convert';

import 'package:apis/swiggerApi/screens/getScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class createNote extends StatefulWidget {

  @override
  _createNoteState createState() => _createNoteState();
}

class _createNoteState extends State<createNote> {
  TextEditingController noteTitle = TextEditingController();
  TextEditingController noteContent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: noteTitle,
                decoration: InputDecoration(
                  hintText: "Enter note Title"
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: noteContent,
                decoration: InputDecoration(
                    hintText: "Enter note Content"
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
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
                    // //  print("helk");
                    // String title = name1.text.trim();
                    // String content = name2.text.trim();
                    // updateUserData(title, content, widget.noteId);
                    String title = noteTitle.text.trim();
                    String content = noteContent.text.trim();
                    await createNote(title,content).then((value){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>GetScreen()));
                    });
                  },
                  child: Text("Create Note")),
            )
          ],
        ),
      ),
    );
  }
  Future createNote(String title, String content)async{
    String url = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app/notes';
    final create = jsonEncode({
      "noteTitle": title,
      "noteContent": content});
    final response =await http.post(Uri.parse(url),
    body: create,
    headers: {
      'apiKey': '16dbf33d-09bf-4e79-81f3-be46506b7493',
      'content-Type': 'application/json'
    });
    if(response.statusCode ==200){
      print(response.body);
    }else{
      print(response.statusCode);
      print(response.request);
      print(response.headers);
    }
  }
}
