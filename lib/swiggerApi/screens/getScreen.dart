import 'dart:convert';

import 'package:apis/model/userModel.dart';
import 'package:apis/swiggerApi/model/getData.dart';
import 'package:apis/swiggerApi/screens/createNote.dart';
import 'package:apis/swiggerApi/screens/eidtNote.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class GetScreen extends StatefulWidget {
  @override
  _getScreenState createState() => _getScreenState();
}

class _getScreenState extends State<GetScreen> {
  bool isEditing = false;
  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  List<GetDataModel> _getData;
  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();
  Future<List<GetDataModel>> getData() async {
    final url = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app/notes';
    final header = {"apiKey": "16dbf33d-09bf-4e79-81f3-be46506b7493"};
    final response = await http.get(Uri.parse(url), headers: header);
    if (response.statusCode == 200) {
      final List<GetDataModel> data = getDataModelFromJson(response.body);
      //print(response.body);
      return data;
    } else {
      return <GetDataModel>[];
    }
  }

  @override
  void initState() {
    getData().then((value) {
      setState(() {
        _getData = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => createNote()));
        },
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Get Data",
          style: TextStyle(color: Colors.green[900]),
        ),
        actions: [
          Text("log press to del NOTE")
        ],
      ),
      body: _getData == null
          ? Center(child: Text("Loading data please wait ..."))
          : RefreshIndicator(
              key: _key,
              onRefresh: getData,
              child: FutureBuilder(
                future: getData(),
                builder: (BuildContext context, dataGet) {
                  return ListView.builder(
                    itemCount: _getData.length,
                    itemBuilder: (context, int index) {
                      var data = _getData[index];
                      return Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => EditNote(
                                          noteId: _getData[index].noteId,
                                        )));
                            print(data.noteId);
                          },
                          onLongPress: () {
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                                "Are you sure you want to delete note??")),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                                onPressed: () async{
                                                  await updateUserData(_getData[index].noteId).then((value) {
                                                    Navigator.push(context, MaterialPageRoute(builder: (_)=>GetScreen()));
                                                  });
                                                },
                                                child: Text("Yes")),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("No")),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          title: Text(data.noteTitle),
                          subtitle: Text(
                              "Last edit on ${formatDateTime(data.latestEditDateTime ?? data.createDateTime)}"),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
    );
  }

  Future updateUserData(String id) async {
    final String url = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app/notes/$id';
    print(url);
    // final msg = jsonEncode({"noteTitle": title,
    //   "noteContent": content});
    final response = await http.delete(
      Uri.parse(url),
      headers: {
        'apiKey': '16dbf33d-09bf-4e79-81f3-be46506b7493',
        'content-Type': 'application/json'
        // 'content-type': 'application/x-www-form-urlencoded',
        // 'content-type': 'application/problem+json',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      return jsonData;
    } else {
      print(response.statusCode);
      print(response.request);
      print(response.headers);
      print('error');
    }
  }
}
