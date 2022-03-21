
import 'package:apis/covid_nine_app/models/NewCovidModel.dart';
import 'package:apis/covid_nine_app/screens/track_countries.dart';
import 'package:apis/covid_nine_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // CovidModel covidModel;
  final colorList = <Color>[
   Color(0xff4285F4),
   Color(0xff1aa260),
   Color(0xffde5246),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("COVID-19 TRACKER"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: Services.getCovidData(),
              builder: (BuildContext context, AsyncSnapshot<NewCovidModel> snapshot) {
                if (!snapshot.hasData) {
                  // print("no dara coming");
                  return Expanded(
                    flex: 1,
                    child: SpinKitFadingCircle(
                      color: Colors.black,
                      size: 50,
                    ),
                  );
                } else {
                  // print("dta is coming");
                  var data =snapshot.data;
                  return Column(
                    children: [
                      PieChart(
                        chartValuesOptions: ChartValuesOptions(
                          showChartValuesInPercentage: true
                        ),
                        dataMap: {
                          'Total': double.parse(data.cases.toString()),
                          'Recovered': double.parse(data.recovered.toString()),
                          'Death': double.parse(data.deaths.toString()),
                        },
                        legendOptions:
                            LegendOptions(legendPosition: LegendPosition.left),
                        chartRadius: MediaQuery.of(context).size.width / 4.2,
                        animationDuration: Duration(seconds: 2),
                        chartType: ChartType.ring,
                        colorList: colorList,
                      ),
                      SizedBox(height: 10,),
                      Column(
                        children: [
                          Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: ReuseAble(title: 'Cases', value: data.cases.toString()),
                          ),
                          Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: ReuseAble(title: 'Deaths', value: data.deaths.toString()),
                          ),
                          Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: ReuseAble(title: 'Recovered', value: data.recovered.toString()),
                          ),
                          Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: ReuseAble(title: 'Active', value: data.active.toString()),
                          ),
                          Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: ReuseAble(title: 'Critical', value: data.critical.toString()),
                          ),
                          Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: ReuseAble(title: 'Today Death', value: data.todayDeaths.toString()),
                          ),
                          Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: ReuseAble(title: 'Today Recovered', value: data.todayRecovered.toString()),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>TrackCountries()));
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Center(
                              child: Text(
                                "Track Countries",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ReuseAble extends StatelessWidget {
  String title;
  String value;
  ReuseAble({@required this.title, @required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Text(
                value,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 17),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
