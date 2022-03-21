



import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Screen5 extends StatefulWidget {

  @override
  _Screen5State createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  Future updateUserData(String name,String job)async{
    final String url = 'https://reqres.in/api/users/2';
    final response = await http.put(Uri.parse(url),body: {
      "name": name,
      "job": job
    });
    var data = response.body;
    print(data);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                  String userPassword = emailController.text.trim();
                  setState(() {
                    updateUserData(userEmail, userPassword);
                  });
                },
                child: Text("Put Data")),
          ],
        ),
      ),
    );
  }
}
