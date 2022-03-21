import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Users Data"),
      ),
      body: Container(
        child: FutureBuilder(
          future: getUserData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text("loading....."),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  var data = snapshot.data[i];
                  return ListTile(
                    title: Text(data.name),
                    subtitle: Text(data.email),
                    trailing: Text(data.userName),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Future getUserData() async {
    var response = await http.get(
      Uri.http('jsonplaceholder.typicode.com', 'users'),
    );
    var jsonData = jsonDecode(response.body);
    List<User> users = [];
    for (var u in jsonData) {
      User user =
      User(name: u['name'], email: u['email'], userName: u['username']);
      users.add(user);
    }
    // print(jsonData);
    return users;
  }
}

class User {
  String name, email, userName;
  User({@required this.name, @required this.email, @required this.userName});
}
