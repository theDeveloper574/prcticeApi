import 'package:apis/model/postData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'services.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  ///posts data coming from apis
  List<PostData> posts;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    isLoading = true;
    Services.getPostData().then((value) {
      setState(() {
        posts = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(isLoading ? "loading...." : "Posts Data"),
      ),
      body: posts == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                PostData data = posts[index];
                return Card(
                  child: ListTile(
                    title: Text(data.body),
                    trailing: Text(data.id.toString()),
                    subtitle: Text(data.title),
                  ),
                );
              },
            ),
    );
  }

  // Future getPostsData() async {
  //   var response =await http.get(
  //     Uri.http('jsonplaceholder.typicode.com', 'posts'),
  //   );
  //   var jsonData = jsonDecode(response.body);
  //   print(jsonData);
  // }
}
