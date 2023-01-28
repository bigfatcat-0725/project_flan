import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

class ProfileController {
  void reject({required int seq}) async {
    final url = Uri.parse(
        'http://121.254.254.170:8855/API/questions/status/update/$seq');

    var body = jsonEncode({"status": "1"});
    print(body);

    var data = await http.put(
      url,
      body: body,
      headers: {
        "accept": "application/json",
      },
    );

    if (data.statusCode == 200) {
      if (kDebugMode) {
        print(data.statusCode);
      }
    } else {
      if (kDebugMode) {
        print(data.body);
      }
    }
  }

  void postAnswer({
    required int user,
    required int question,
    required String reply,
  }) async {
    final url = Uri.parse('http://topping.io:8855/API/answers');

    var request = http.MultipartRequest("POST", url)
      ..fields['user_seq'] = user.toString()
      ..fields['question_seq'] = question.toString()
      ..fields['reply'] = reply.toString();

    var res = await request.send();

    if (res.statusCode == 200) {
      if (kDebugMode) {
        print('성공');
      }
    } else {
      if (kDebugMode) {
        print(res.statusCode);
      }
    }
  }
}
