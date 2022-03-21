


import 'package:apis/model/todoItems.dart';
import 'package:http/http.dart' as http;

class ServiceTodoItems {
  static Future <List<TodoItems>>getIData(String valuee)async{
    String url ='https://jsonplaceholder.typicode.com/comments?postId=$valuee';
    final response =await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final List<TodoItems> getTodo = todoItemsFromJson(response.body);
      return getTodo;
    }else{
      return <TodoItems>[];
    }
  }
}