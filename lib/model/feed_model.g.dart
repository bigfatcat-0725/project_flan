// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeedModel _$$_FeedModelFromJson(Map<String, dynamic> json) => _$_FeedModel(
      myData: json['my_data'] == null
          ? null
          : MyData.fromJson(json['my_data'] as Map<String, dynamic>),
      question: (json['question'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      follower: (json['follower'] as List<dynamic>?)
          ?.map((e) => MyData.fromJson(e as Map<String, dynamic>))
          .toList(),
      following: (json['following'] as List<dynamic>?)
          ?.map((e) => MyData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FeedModelToJson(_$_FeedModel instance) =>
    <String, dynamic>{
      'my_data': instance.myData,
      'question': instance.question,
      'follower': instance.follower,
      'following': instance.following,
    };

_$_MyData _$$_MyDataFromJson(Map<String, dynamic> json) => _$_MyData(
      email: json['email'] as String?,
      nickname: json['nickname'] as String?,
      phoneNumber: json['phone_number'] as String?,
      snsId: json['sns_id'] as String?,
      status: json['status'] as String?,
      rememberToken: json['remember_token'] as String?,
      auth: json['auth'] as String?,
      seq: json['seq'] as int?,
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      password: json['password'] as String?,
      photo: json['photo'] as String?,
      followCnt: json['follow_cnt'] as int?,
      snsType: json['sns_type'] as String?,
      emailVerifiedAt: json['email_verified_at'],
      userLevel: json['user_level'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      lastLogin: json['last_login'] == null
          ? null
          : DateTime.parse(json['last_login'] as String),
      answerCnt: json['answer_cnt'] as int?,
    );

Map<String, dynamic> _$$_MyDataToJson(_$_MyData instance) => <String, dynamic>{
      'email': instance.email,
      'nickname': instance.nickname,
      'phone_number': instance.phoneNumber,
      'sns_id': instance.snsId,
      'status': instance.status,
      'remember_token': instance.rememberToken,
      'auth': instance.auth,
      'seq': instance.seq,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'password': instance.password,
      'photo': instance.photo,
      'follow_cnt': instance.followCnt,
      'sns_type': instance.snsType,
      'email_verified_at': instance.emailVerifiedAt,
      'user_level': instance.userLevel,
      'created_at': instance.createdAt?.toIso8601String(),
      'last_login': instance.lastLogin?.toIso8601String(),
      'answer_cnt': instance.answerCnt,
    };

_$_Question _$$_QuestionFromJson(Map<String, dynamic> json) => _$_Question(
      toSeq: json['to_seq'] as int?,
      photo: json['photo'] as String?,
      private: json['private'] as String?,
      unknownName: json['unknown_name'],
      updatedAt: json['updated_at'],
      seq: json['seq'] as int?,
      userSeq: json['user_seq'] as int?,
      question: json['question'] as String?,
      likes: json['likes'] as int?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      topAnswer: json['top_answer'] as List<dynamic>?,
      answer: (json['answer'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'to_seq': instance.toSeq,
      'photo': instance.photo,
      'private': instance.private,
      'unknown_name': instance.unknownName,
      'updated_at': instance.updatedAt,
      'seq': instance.seq,
      'user_seq': instance.userSeq,
      'question': instance.question,
      'likes': instance.likes,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'top_answer': instance.topAnswer,
      'answer': instance.answer,
    };

_$_Answers _$$_AnswersFromJson(Map<String, dynamic> json) => _$_Answers(
      questionSeq: json['question_seq'] as int?,
      photo: json['photo'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      seq: json['seq'] as int?,
      userSeq: json['user_seq'] as int?,
      reply: json['reply'] as String?,
      likes: json['likes'] as int?,
      updatedAt: json['updated_at'],
      pSeq: json['p_seq'] as int?,
      comment: (json['comment'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AnswersToJson(_$_Answers instance) =>
    <String, dynamic>{
      'question_seq': instance.questionSeq,
      'photo': instance.photo,
      'created_at': instance.createdAt?.toIso8601String(),
      'seq': instance.seq,
      'user_seq': instance.userSeq,
      'reply': instance.reply,
      'likes': instance.likes,
      'updated_at': instance.updatedAt,
      'p_seq': instance.pSeq,
      'comment': instance.comment,
    };

_$_Answer _$$_AnswerFromJson(Map<String, dynamic> json) => _$_Answer(
      users: json['Users'] == null
          ? null
          : MyData.fromJson(json['Users'] as Map<String, dynamic>),
      answers: json['Answers'] == null
          ? null
          : Answers.fromJson(json['Answers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AnswerToJson(_$_Answer instance) => <String, dynamic>{
      'Users': instance.users,
      'Answers': instance.answers,
    };
