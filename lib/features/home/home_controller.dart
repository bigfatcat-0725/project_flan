import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:project_flan/model/feed_model.dart';

final feedProvider = StateProvider<FeedModel?>((ref) {
  return null;
});

final homeControllerProvider = StateNotifierProvider<HomeController, bool>(
  (ref) => HomeController(
    ref: ref,
  ),
);

class HomeController extends StateNotifier<bool> {
  final Ref _ref;
  HomeController({required Ref ref})
      : _ref = ref,
        super(false);

  // 피드 가져오기
  // 1 답변대기 2 답변완료 3 답변거절
  Future<FeedModel?> getFeed({seq, status}) async {
    final url = Uri.parse(
        'http://121.254.254.170:8855/API/feed/main/$seq?status=$status');

    var data = await http.get(
      url,
      headers: {
        "accept": "application/json",
      },
    );

    var decodeData = utf8.decode(data.bodyBytes);
    var response = jsonDecode(decodeData);

    if (data.statusCode == 200) {
      final feedModel = FeedModel.fromJson(response as Map<String, dynamic>);
      return feedModel;
    } else {
      if (kDebugMode) {
        print(data.statusCode);
      }
      return null;
    }
  }

  // 질문하기
  // to_seq 0 일 경우 전체에게 질문
  void postQuestion(
      {required int to,
      required int from,
      required String title,
      required String private}) async {
    final url = Uri.parse('http://topping.io:8855/API/questions');

    var request = http.MultipartRequest("POST", url)
      ..fields['to_seq'] = to.toString()
      ..fields['from_seq'] = from.toString()
      ..fields['question'] = title.toString()
      ..fields['private'] = private.toString()
      ..fields['status'] = "1".toString();

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

  // 답변수정
  void editAnswer(seq, reply, img) async {
    final url = Uri.parse('http://121.254.254.170:8855/API/answers/$seq');

    var request = http.MultipartRequest("PUT", url)
      ..fields['seq'] = seq.toString()
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
