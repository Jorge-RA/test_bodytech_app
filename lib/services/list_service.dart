import 'dart:convert';

import 'package:bodytech_test_app/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ListServices {
  List<UserModel> users = [];
  final String _url = 'jsonplaceholder.typicode.com';

  Future<List<UserModel>> getUsers() async {
    final url = Uri.https(_url, '/posts');
    final response = await http.get(url);
    final List decodedData = json.decode(response.body);
    decodedData.forEach((element) {
      users.add(UserModel.fromMap(element));
    });

    return users;
  }
}
