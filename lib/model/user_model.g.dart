// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      email: json['email'] as String?,
      nickname: json['nickname'] as String?,
      phone_number: json['phone_number'] as String?,
      sns_type: json['sns_type'] as String?,
      email_verified_at: json['email_verified_at'],
      user_level: json['user_level'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      seq: json['seq'] as int?,
      deleted_at: json['deleted_at'],
      last_login: json['last_login'],
      password: json['password'] as String?,
      photo: json['photo'] as String?,
      sns_id: json['sns_id'] as String?,
      status: json['status'] as String?,
      remember_token: json['remember_token'] as String?,
      auth: json['auth'] as String?,
      updated_at: json['updated_at'],
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'nickname': instance.nickname,
      'phone_number': instance.phone_number,
      'sns_type': instance.sns_type,
      'email_verified_at': instance.email_verified_at,
      'user_level': instance.user_level,
      'created_at': instance.created_at?.toIso8601String(),
      'seq': instance.seq,
      'deleted_at': instance.deleted_at,
      'last_login': instance.last_login,
      'password': instance.password,
      'photo': instance.photo,
      'sns_id': instance.sns_id,
      'status': instance.status,
      'remember_token': instance.remember_token,
      'auth': instance.auth,
      'updated_at': instance.updated_at,
    };
