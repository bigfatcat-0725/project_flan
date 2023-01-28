// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? email,
    String? nickname,
    String? phone_number,
    String? sns_type,
    dynamic email_verified_at,
    String? user_level,
    DateTime? created_at,
    int? seq,
    dynamic deleted_at,
    dynamic last_login,
    String? password,
    String? photo,
    String? sns_id,
    String? status,
    String? remember_token,
    String? auth,
    dynamic updated_at,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
