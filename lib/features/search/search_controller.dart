import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:project_flan/model/category_model.dart';
import 'package:project_flan/model/user_model.dart';

class SearchController {
  Future<List> getSearchUserList({nikname}) async {
    final url = Uri.parse(
        'http://121.254.254.170:8855/API/users/nickname/search?search=$nikname');

    var data = await http.get(
      url,
      headers: {
        "accept": "application/json",
      },
    );

    var decodeData = utf8.decode(data.bodyBytes);
    var response = jsonDecode(decodeData);

    if (data.statusCode == 200 && response.isNotEmpty) {
      final userList = [];
      for (var a in response) {
        userList.add(UserModel.fromJson(a as Map<String, dynamic>));
      }
      return userList;
    } else {
      if (kDebugMode) {
        print(data.statusCode);
      }
      return [];
    }
  }
}
