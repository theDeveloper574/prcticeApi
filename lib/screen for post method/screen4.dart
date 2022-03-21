



import 'dart:convert';

import 'package:apis/model/userSignUp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Screen4 extends StatefulWidget {
  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  UserSignUp _userSignUp;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Future<UserSignUp>userSignUp(String email,String password)async{
    String url = 'https://reqres.in/api/login';
    final response = await http.post(Uri.parse(url),body: {
      "email": email,
      "password": password
    });
    final jsonData = jsonDecode(response.body);
    print(jsonData);
    if(response.statusCode == 200){
      userSignUpFromJson(response.body);
    }else{
      print(response.body);
      print(response.request);
      print(response.headers);
      print("no user found");
    }
  }
  //eve.holt@reqres.im
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign UP User"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    isDense: true,
                    hintText: 'email',
                    border: OutlineInputBorder()),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    isDense: true,
                    hintText: 'password',
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async{
                  String userEmail = nameController.text.trim();
                  String userPassword = nameController.text.trim();
                  UserSignUp user= await userSignUp(userEmail, userPassword);
                  setState(() {
                    _userSignUp= user;
                  });
                },
                child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
