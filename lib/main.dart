
import 'package:apis/listViewForSearch/screen.dart';
import 'package:apis/pul_to_refresh/refresh_screen.dart';
import 'package:apis/screen%20for%20post%20method/screen2.dart';
import 'package:apis/swiggerApi/screens/getScreen.dart';
import 'package:flutter/material.dart';
import 'covid_nine_app/screens/home.dart';
import 'screen for post method/screen1.dart';
import 'screen for post method/screen3.dart';
import 'screen for post method/screen4.dart';
import 'screen for post method/screen5.dart';
import 'screens for get method/checkItemValues.dart';
import 'screens for get method/getId.dart';
import 'screens for get method/todoMethod.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
void main(){
  runApp(MyApp());
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
