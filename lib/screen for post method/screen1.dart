import 'package:apis/model/postModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

Future<PostModel> submitData(String name, String job) async {
  final response = await http.post(Uri.parse('https://reqres.in/api/users'),
      body: {'name': name, 'job': job});
  var data = response.body;
  print(data);
  if(response.statusCode == 201){
    String responseString = response.body;
    postModelFromJson(responseString);
  }else return null;
}

class _Screen1State extends State<Screen1> {
  PostModel postModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Http Post Method"),
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
                    hintText: 'Enter Name',
                    border: OutlineInputBorder()),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: jobController,
                decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Enter Job',
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async{
                  String name = nameController.text.trim();
                  String job = jobController.text.trim();
                  PostModel data = await submitData(name, job);
                  setState(() {
                    postModel = data;
                  });
                },
                child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
