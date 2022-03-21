import 'dart:convert';

import 'package:apis/model/todoItems.dart';
import 'package:apis/model/todoModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'servicesList.dart';

class TodoMethod extends StatefulWidget {
  String id;
  // int id;

  TodoMethod({@required this.id});
  @override
  _TodoMethodState createState() => _TodoMethodState();
}

class _TodoMethodState extends State<TodoMethod> {
  List<TodoItems> _todoItems;
  @override
  void initState() {
    print(widget.id);
    ServiceTodoItems.getIData(widget.id).then((value) {
      setState(() {
        _todoItems = value;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("todo Items"),
      ),
      body: _todoItems==null? Center(child: CircularProgressIndicator(),): ListView.builder(
        itemCount: _todoItems.length,
          itemBuilder: (context,int index){
          var data = _todoItems[index];
              return ListTile(
                subtitle: Text(data.email),
              );
          }),
    );
  }
}
