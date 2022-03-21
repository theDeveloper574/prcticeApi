import 'package:http/http.dart' as http;
import 'package:apis/model/postData.dart';

class Services {
  static const String url = 'https://jsonplaceholder.typicode.com/posts';
  static Future<List<PostData>> getPostData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final List<PostData> posts = postDataFromJson(response.body);
        return posts;
      } else {
        return <PostData>[];
      }
    } catch (e) {
      print(e);
      return <PostData>[];
    }
  }
}
