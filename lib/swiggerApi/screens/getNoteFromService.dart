// import 'dart:convert';
//
// import 'package:apis/swiggerApi/model/createNote.dart';
// import 'package:http/http.dart' as http;
//
// class ServiceNote {
//   static Future<CreateNote> getData(String id, CreateNote item) async {
//     final url = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app/notes/' + id;
//     final header = {"apiKey": "16dbf33d-09bf-4e79-81f3-be46506b7493"};
//     return await http.put(Uri.parse(url),
//         headers: header, body: jsonEncode(item.toJson())).then((value) {
//           if(value.statusCode == 204){
//             return CreateNote();
//           }
//           return null;
//     }).catchError((e)=>print(e));
//   }
// }
