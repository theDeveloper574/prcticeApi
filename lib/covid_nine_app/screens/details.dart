import 'package:apis/covid_nine_app/screens/track_countries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  String country;
  int cases;
  int recovered;
  int death;
  int critical;
  int totalRecovered;
  Detail(
      {@required this.country,
      @required this.cases,
      @required this.recovered,
      @required this.critical,
      @required this.death,
      @required this.totalRecovered});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222222),
      appBar: AppBar(
        backgroundColor: Color(0xff515151),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
        country,
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => TrackCountries()));
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Color(0xff515151),
            width: double.infinity,
            // height: 200,
            // color: Colors.white,
            child: ListView(
              shrinkWrap: true,
              children: [
                ReuseAble(name: 'Cases',value: cases.toString()?? ''),
                Divider(color: Colors.grey,),
                ReuseAble(name: 'Recovered',value: recovered.toString()?? ''),
                Divider(color: Colors.grey,),
                ReuseAble(name: 'Deaths',value: death.toString()?? ''),
                Divider(color: Colors.grey,),
                ReuseAble(name: 'Critical',value: critical.toString()?? ''),
                Divider(color: Colors.grey,),
                ReuseAble(name: 'Today Recovered',value: recovered.toString()?? ''),
              ],
            ),
          )
        ],
      ),
    );
  }
}
class ReuseAble extends StatelessWidget {
  String name;
  String value;
  ReuseAble({@required this.name,@required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            value.toString(),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18),
          ),
        ],
      ),
    );
  }
}

