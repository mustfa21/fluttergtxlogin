// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:products_youtube/database/models/user_model.dart';

class AuthServices {
  static String url = 'http://192.168.43.31:8000/api/v1';
  static var client = http.Client();

  static register({required name, required email, required password}) async {
    var res = await client.post(Uri.parse('$url/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          "name": name,
          "email": email,
          "password": password
        }));

    if (res.statusCode == 200 || res.statusCode == 201) {
      var stringObject = res.body;
      var user = userModelFromJson(stringObject);

      return user;
    } else {
      return null;
    }
  }

  static login({required email, required password}) async {
    var res = await client.post(Uri.parse('$url/login'),
        headers: {'Content-Type': 'application/json'},
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));

    if (res.statusCode == 200 || res.statusCode == 201) {
      var stringObject = res.body;
      var user = userModelFromJson(stringObject);
      return user;
    }
  }
}
