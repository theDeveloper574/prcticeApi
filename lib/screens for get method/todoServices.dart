





import 'package:apis/model/todoModel.dart';
import 'package:http/http.dart' as http;

class TodoServices{
  static const String url= 'https://jsonplaceholder.typicode.com/todos';
  static Future getTodo()async{
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final List<TodoModel> todo =todoModelFromJson(response.body);
      return todo;
    }else{
      return <TodoModel>[];
    }
  }
}