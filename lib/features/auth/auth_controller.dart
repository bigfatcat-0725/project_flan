import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:project_flan/features/auth/widgets/sign_success.dart';
import 'package:project_flan/features/home/home_controller.dart';
import 'package:project_flan/model/user_model.dart';
import 'package:project_flan/router.dart';

final userProvider = StateProvider<UserModel?>((ref) {
  return null;
});

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(
    ref: ref,
  ),
);

class AuthController extends StateNotifier<bool> {
  final Ref _ref;
  AuthController({required Ref ref})
      : _ref = ref,
        super(false);

  void login(String email, String password) async {
    var data = await http.post(
      Uri.parse('http://topping.io:8855/API/users/login'),
      body: {
        'email': email,
        'password': password,
      },
      headers: {
        "accept": "application/json",
        "content-type": "application/x-www-form-urlencoded",
      },
    );

    var decodeData = utf8.decode(data.bodyBytes);
    var response = jsonDecode(decodeData);

    if (data.statusCode == 200) {
      final userModel =
          UserModel.fromJson(response['user_info'] as Map<String, dynamic>);
      _ref.read(userProvider.notifier).update((state) => userModel);

      if (_ref.read(userProvider.notifier).state != null) {
        router.go('/home');
      }
    } else {
      if (kDebugMode) {
        print(data.statusCode);
      }
    }
  }

  void logout() async {
    var data = await http.delete(
      Uri.parse('http://topping.io:8855/API/users/logout'),
      headers: {
        "accept": "application/json",
      },
    );

    if (data.statusCode == 200) {
      router.go('/');
    } else {
      if (kDebugMode) {
        print(data.statusCode);
      }
    }
  }

  void sign(
    String nickname,
    String email,
    String password,
    BuildContext context,
  ) async {
    final url = Uri.parse('http://topping.io:8855/API/users');

    var request = http.MultipartRequest("POST", url)
      ..fields['nickname'] = nickname
      ..fields['email'] = email
      ..fields['password'] = password;

    var response = await request.send();

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return const SignSuccess();
        },
      );
      // router.go('/');
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
  }
}
