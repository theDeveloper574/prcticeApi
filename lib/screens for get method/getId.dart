import 'package:apis/model/todoItems.dart';
import 'package:flutter/material.dart';

import 'todoMethod.dart';
import 'package:http/http.dart' as http;

class GetId extends StatefulWidget {
  @override
  _GetIdState createState() => _GetIdState();
}

class _GetIdState extends State<GetId> {
  List<TodoItems> _todoItems;
  TextEditingController idValue = TextEditingController();
  Future<List<TodoItems>> getTo(int id) async {
    String url = 'https://jsonplaceholder.typicode.com/comments?postId=$idValue';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<TodoItems> getTodo = todoItemsFromJson(response.body);
      return getTodo;
    } else {
      return <TodoItems>[];
    }
  }

  @override
  void initState() {
    getTo(int.tryParse(idValue.text)).then((value) {
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
        title: InkWell(
          onTap: () {
          },
          child: Text("GetID"),
        ),
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: idValue,
              )),
          TextButton(
              onPressed: () async{
              //  var  ids=await getTo(int.parse(id.text));
              //   print(ids);
              // var ids= getTo(int.tryParse(idValue.text));
              //print(ids);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => TodoMethod(id: idValue.text)));

              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}
