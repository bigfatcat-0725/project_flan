// To parse this JSON data, do
//
//     final feedModel = feedModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'feed_model.dart';
import 'feed_model.dart';
import 'feed_model.dart';
import 'feed_model.dart';

part 'feed_model.freezed.dart';
part 'feed_model.g.dart';

FeedModel feedModelFromJson(String str) => FeedModel.fromJson(json.decode(str));

String feedModelToJson(FeedModel data) => json.encode(data.toJson());

@freezed
class FeedModel with _$FeedModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FeedModel({
    MyData? myData,
    List<Question>? question,
    List<MyData>? follower,
    List<MyData>? following,
  }) = _FeedModel;

  factory FeedModel.fromJson(Map<String, dynamic> json) =>
      _$FeedModelFromJson(json);
}

@freezed
class MyData with _$MyData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MyData({
    String? email,
    String? nickname,
    String? phoneNumber,
    String? snsId,
    String? status,
    String? rememberToken,
    String? auth,
    int? seq,
    dynamic? updatedAt,
    dynamic? deletedAt,
    String? password,
    String? photo,
    int? followCnt,
    String? snsType,
    dynamic? emailVerifiedAt,
    String? userLevel,
    DateTime? createdAt,
    DateTime? lastLogin,
    int? answerCnt,
  }) = _MyData;

  factory MyData.fromJson(Map<String, dynamic> json) => _$MyDataFromJson(json);
}

@freezed
class Question with _$Question {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Question({
    int? toSeq,
    String? photo,
    String? private,
    dynamic? unknownName,
    dynamic? updatedAt,
    int? seq,
    int? userSeq,
    String? question,
    int? likes,
    String? status,
    DateTime? createdAt,
    List<dynamic>? topAnswer,
    List<Answer>? answer,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

@freezed
class Answers with _$Answers {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Answers({
    int? questionSeq,
    String? photo,
    DateTime? createdAt,
    int? seq,
    int? userSeq,
    String? reply,
    int? likes,
    dynamic? updatedAt,
    int? pSeq,
    List<Answer>? comment,
  }) = _Answers;

  factory Answers.fromJson(Map<String, dynamic> json) =>
      _$AnswersFromJson(json);
}

@freezed
class Answer with _$Answer {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Answer({
    @JsonKey(name: 'Users') MyData? users,
    @JsonKey(name: 'Answers') Answers? answers,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
