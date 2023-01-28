import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:project_flan/model/category_model.dart';
import 'package:project_flan/model/feed_model.dart';

class CommunityController {
  Future<List> getCategory({seq, status}) async {
    final url = Uri.parse('http://121.254.254.170:8855/API/category');

    var data = await http.get(
      url,
      headers: {
        "accept": "application/json",
      },
    );

    var decodeData = utf8.decode(data.bodyBytes);
    var response = jsonDecode(decodeData);

    if (data.statusCode == 200) {
      final categoryList = [];
      for (var a in response) {
        categoryList.add(CategoryModel.fromJson(a as Map<String, dynamic>));
      }
      print(categoryList);
      return categoryList;
    } else {
      if (kDebugMode) {
        print(data.statusCode);
      }
      return [];
    }
  }
}
