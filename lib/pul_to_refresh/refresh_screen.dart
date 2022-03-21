import 'dart:convert';

import 'package:apis/pul_to_refresh/model/random_user.dart';
import 'package:apis/screens%20for%20get%20method/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PullTo extends StatefulWidget {
  @override
  _PullToState createState() => _PullToState();
}

class _PullToState extends State<PullTo> {
  // RandomUser randomUser = RandomUser('deafaultUser','NOman');
  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();
  RandomUser _randomUser;
  Future<RandomUser> get() async {
    final String url = 'https://randomuser.me/api/';
    // final header = {'apiKey': '16dbf33d-09bf-4e79-81f3-be46506b7493'};
    final response = await http.get(Uri.parse(url));
    //final jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // print(jsonData);
      randomUserFromJson(response.body);
      print(response.body);
    } else {
      print('no data come');
      // return <GetData>[];
    }
  }

  @override
  void initState() {
    get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pull To Refresh Screen"),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 20,
        itemBuilder: (context, int index){
          return Container(
            margin: EdgeInsets.all(10),
            height: 20,
            color: Colors.red,
          );
        },
      ),
    );
  }
}
