


import 'package:apis/model/photosModel.dart';
import 'package:flutter/material.dart';

import 'serviceImage.dart';

class Screen4 extends StatefulWidget {

  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  List<ImageModel> imageModel;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    isLoading = true;
      ServiceImage.getImageData().then((value) {
        setState(() {
          imageModel = value;
          isLoading = false;
        });
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(isLoading ?'loading image....': "Apis Photos"),
      ),
      body: Container(
        child: imageModel ==null? Center(child: Text("loading...")) :ListView.builder(
          itemCount: imageModel.length,
          itemBuilder: (context, index){
            var data = imageModel[index];
            return Container(
              height: 120,
              width: 120,
              child: Image.network(data.thumbnailUrl,fit: BoxFit.cover,),
            );
          },
        ),
      ),
    );
  }
}
