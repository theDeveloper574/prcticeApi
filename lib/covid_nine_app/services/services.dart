import 'dart:convert';

import 'package:apis/covid_nine_app/models/NewCovidModel.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future<NewCovidModel> getCovidData() async {
    String url = 'https://disease.sh/v3/covid-19/all';
    final response = await http.get(Uri.parse(url),headers: {

    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return NewCovidModel.fromJson(data);
    } else {
      print("no data coming");
      return NewCovidModel();
    }
  }

  static Future<List<dynamic>> getCountryData() async {
    var data;
    String urlCountry = 'https://disease.sh/v3/covid-19/countries';
    final response = await http.get(Uri.parse(urlCountry));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      print("no data coming");
    }
  }
}
