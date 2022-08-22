import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:interview/models/user_model.dart';

class ApiConstants {
  static String baseUrl = 'https://api-nodejs-todolist.herokuapp.com';
  static String usersEndpoint = '/user/login';
}

class ApiService {
  static Future getUsers({String? email, String? password}) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          "email": email!,
          "password": password!,
        }),
      );
      if (response.statusCode == 200) {
        var model = UserModel.fromJson(response.body);

        return model;
      } else {
        throw Exception(response.body.toString());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
