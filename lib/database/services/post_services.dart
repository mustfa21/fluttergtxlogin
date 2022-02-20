import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:products_youtube/database/models/post_model.dart';

class PostServices {
  static String url = 'http://192.168.43.31:8000/api/v1';
  static var client = http.Client();

  static addPost({
    required title,
    required content,
  }) async {
    var res = await client.post(Uri.parse('$url/Posts'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          "title": title,
          "content": content,
        }));

    if (res.statusCode == 200 || res.statusCode == 201) {
      var stringObject = res.body;
      var post = postModelFromJson(stringObject);
      var listPost = post.data;
      return listPost;
    } else {
      return null;
    }
  }

  static Future getPost() async {
    var res = await client.get(
      Uri.parse('$url/posts'),
    );

    if (res.statusCode == 200 || res.statusCode == 201) {
      var stringObject = res.body;
      var post = postModelFromJson(stringObject);

      return post.data;
    }
  }
}
