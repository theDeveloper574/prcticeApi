


import 'package:apis/model/photosModel.dart';
import 'package:http/http.dart' as http;

class ServiceImage {
  static const String url ='https://jsonplaceholder.typicode.com/photos';
  static Future <List<ImageModel>>getImageData()async{
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final List<ImageModel> image = imageModelFromJson(response.body);
      return image;
    }else{
      return <ImageModel>[];
    }
  }
}