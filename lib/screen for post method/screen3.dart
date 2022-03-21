import 'dart:convert';

import 'package:apis/model/putUserData.dart';
import 'package:apis/model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Screen3 extends StatefulWidget {

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  GetUserData _getUserData;
  onPressed()async{
    final data =await getUserData1();
    setState(() {
      _getUserData = data;
    });
    if(_getUserData == null){
      print("null values");
    }else{
      print("ok good");
    }
  }
  Future<GetUserData> getUserData1()async{
    final url = 'https://reqres.in/api/users?page=2';
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      return getUserDataFromJson(response.body);
    }else{
      return null;
    }
  }
  @override
  void initState() {
    onPressed();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _getUserData == null? CircularProgressIndicator():
      ListView.builder(
        itemCount: _getUserData.data.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: Image.network(_getUserData.data[index].avatar),
            subtitle: Text(_getUserData.data[index].firstName),
            trailing: Text(_getUserData.data[index].email),
          );
        },
      ),
    );
  }
}
