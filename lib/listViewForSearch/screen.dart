



import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Note List For Search"),
      ),
      body: ListView.builder(
        itemCount: 2,
          itemBuilder: (ctx,int index){
          return Card(
            child: ListTile(
              title: Text("Note 1"),
              subtitle: Text("Note Content 1"),
            ),
          );
          }
      ),
    );
  }
}
