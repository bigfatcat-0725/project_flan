// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$$_CategoryModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryModel(
      title: json['title'] as String?,
      detail: json['detail'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      seq: json['seq'] as int?,
      photo: json['photo'] as String?,
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'detail': instance.detail,
      'created_at': instance.createdAt?.toIso8601String(),
      'seq': instance.seq,
      'photo': instance.photo,
      'tag': instance.tag,
    };
