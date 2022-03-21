import 'dart:convert';

import 'package:apis/model/putUserData.dart';
import 'package:apis/model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  GetUserData _getUserData;
  // UserCreate userCreate;
  // TextEditingController name = TextEditingController();
  // TextEditingController job = TextEditingController();
  // Future<UserCreate> getUserInfo(String name, String job) async {
  //   String url = 'https://reqres.in/api/users';
  //   final response =
  //       await http.post(Uri.parse(url), body: {'name': name, 'job': job});
  //   var data = response.body;
  //   print(data);
  //   if (response.statusCode == 201) {
  //     String responseString = response.body;
  //     userCreateFromJson(responseString);
  //   } else {
  //     return null;
  //   }
  // }

  onPress() async {
    final GetUserData model = await getUser();
    setState(() {
      _getUserData = model;
    });
    if (_getUserData == null) {
      print('null values');
    } else {
      print('ok');
    }
  }

  Future<GetUserData> getUser() async {
    final url = 'https://reqres.in/api/users?page=2';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return getUserDataFromJson(response.body);
    } else {
      return null;
    }
  }

  @override
  void initState() {
    onPress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get User Data"),
      ),
      body:
      _getUserData == null?
          CircularProgressIndicator():
      Container(
        child:
        ListView.builder(
            itemCount: _getUserData.data.length,
            itemBuilder: (context, index){
              var data = _getUserData.data[index];
          return ListTile(
            title: Text(_getUserData.data[index].firstName.toString()),
            subtitle: Text(_getUserData.support.toString()),
            trailing: Image.network(data.avatar),
          );
        })
      ),
    );
  }
}
