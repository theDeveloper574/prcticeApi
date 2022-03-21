import 'package:apis/covid_nine_app/screens/home.dart';
import 'package:apis/covid_nine_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'details.dart';

class TrackCountries extends StatefulWidget {
  @override
  _TrackCountriesState createState() => _TrackCountriesState();
}

class _TrackCountriesState extends State<TrackCountries> {
  // Services services = Services();
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: _controller,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Search with country name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: Services.getCountryData(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 21,
                      itemBuilder: (context, int index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[700],
                          highlightColor: Colors.grey[100],
                          child: Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  color: Colors.white,
                                  height: 50,
                                  width: 50,
                                ),
                                title: Container(
                                  color: Colors.white,
                                  height: 10,
                                  width: 89,
                                ),
                                subtitle: Container(
                                  color: Colors.white,
                                  height: 10,
                                  width: 89,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, int index) {
                        String name = snapshot.data[index]['country'];
                        if (_controller.text.isEmpty) {
                          return Column(
                            children: [
                              ListTile(
                                onTap: () {

                                  print(index);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Detail(
                                        country: (snapshot.data[index]
                                            ['country']),
                                        cases: (snapshot.data[index]['cases']),
                                        recovered: (snapshot.data[index]
                                            ['recovered']),
                                        death: (snapshot.data[index]['deaths']),
                                        critical: (snapshot.data[index]
                                            ['critical']),
                                        totalRecovered: (snapshot.data[index]
                                            ['recovered']),
                                      ),
                                    ),
                                  );
                                  // print(snapshot.data[index]['country']);
                                  // print(snapshot.data[index]['cases']);
                                  // print(snapshot.data[index]['recovered']);
                                  // print(snapshot.data[index]['deaths']);
                                  // print(snapshot.data[index]['critical']);
                                  // print(snapshot.data[index]['recovered']);
                                },
                                leading: Image(
                                  image: NetworkImage(snapshot.data[index]
                                      ['countryInfo']['flag']),
                                  height: 50,
                                  width: 50,
                                ),
                                title: Text(snapshot.data[index]['country']),
                                subtitle: Text(
                                    snapshot.data[index]['cases'].toString()),
                              ),
                            ],
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(_controller.text.toLowerCase())) {
                          return Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Detail(
                                        country: (snapshot.data[index]
                                        ['country']),
                                        cases: (snapshot.data[index]['cases']),
                                        recovered: (snapshot.data[index]
                                        ['recovered']),
                                        death: (snapshot.data[index]['deaths']),
                                        critical: (snapshot.data[index]
                                        ['critical']),
                                        totalRecovered: (snapshot.data[index]
                                        ['recovered']),
                                      ),
                                    ),
                                  );
                                  // print(snapshot.data[index]['country']);
                                  // print(snapshot.data[index]['cases']);
                                  // print(snapshot.data[index]['recovered']);
                                  // print(snapshot.data[index]['deaths']);
                                  // print(snapshot.data[index]['critical']);
                                  // print(snapshot.data[index]['recovered']);
                                },
                                leading: Image(
                                  image: NetworkImage(snapshot.data[index]
                                      ['countryInfo']['flag']),
                                  height: 50,
                                  width: 50,
                                ),
                                title: Text(snapshot.data[index]['country']),
                                subtitle: Text(
                                    snapshot.data[index]['cases'].toString()),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
//Shimmer.fromColors(
//                       baseColor: Colors.grey[700],
//                       highlightColor: Colors.grey[100],
//                       child: Column(
//                         children: [
//                           ListTile(
//                             leading: Container(
//                               color: Colors.white,
//                               height: 10,
//                               width: 89,
//                             ),
//                             title: Container(
//                               color: Colors.white,
//                               height: 10,
//                               width: 89,
//                             ),
//                             subtitle: Container(
//                               color: Colors.white,
//                               height: 10,
//                               width: 89,
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
