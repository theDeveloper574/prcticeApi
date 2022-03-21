import 'package:apis/model/valueCheck.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Check extends StatefulWidget {
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  List<ValueCheck> _valueCheck;
  Future<List<ValueCheck>> getCheckValue() async {
    final String url =
        'https://jsonplaceholder.typicode.com/todos?completed=true';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<ValueCheck> value = valueCheckFromJson(response.body);
      print(value.length);
      return value;
    } else {
      return <ValueCheck>[];
    }
  }

  @override
  void initState() {
    getCheckValue().then((value){
      setState(() {
        _valueCheck= value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Check Value True or False"),
      ),
      body: _valueCheck== null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _valueCheck.length,
              itemBuilder: (context, int index) {
                var dta = _valueCheck[index];
                return ListTile(
                  title: Text(dta.title),
                  subtitle: Text(dta.completed.toString()),
                );
              },
            ),
    );
  }
}
