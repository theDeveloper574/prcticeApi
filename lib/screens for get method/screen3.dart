import 'package:apis/model/todoModel.dart';
import 'package:flutter/material.dart';

import 'todoServices.dart';

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  List<TodoModel> todoList;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    isLoading = true;
    TodoServices.getTodo().then((value) {
      setState(() {
        todoList = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(isLoading ? 'loading todos...' : "TODO List"),
      ),
      body: todoList == null
          ? Center(
              child: Text("loading data..."),
            )
          : ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                var data = todoList[index];
                return Card(
                  child: ListTile(
                    title: Text(data.title),
                    subtitle: Text(data.id.toString()),
                    trailing: Text(data.completed.toString()),
                  ),
                );
              },
            ),
    );
  }
}
