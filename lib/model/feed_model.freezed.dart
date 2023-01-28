// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeedModel _$FeedModelFromJson(Map<String, dynamic> json) {
  return _FeedModel.fromJson(json);
}

/// @nodoc
mixin _$FeedModel {
  MyData? get myData => throw _privateConstructorUsedError;
  List<Question>? get question => throw _privateConstructorUsedError;
  List<MyData>? get follower => throw _privateConstructorUsedError;
  List<MyData>? get following => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedModelCopyWith<FeedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedModelCopyWith<$Res> {
  factory $FeedModelCopyWith(FeedModel value, $Res Function(FeedModel) then) =
      _$FeedModelCopyWithImpl<$Res, FeedModel>;
  @useResult
  $Res call(
      {MyData? myData,
      List<Question>? question,
      List<MyData>? follower,
      List<MyData>? following});

  $MyDataCopyWith<$Res>? get myData;
}

/// @nodoc
class _$FeedModelCopyWithImpl<$Res, $Val extends FeedModel>
    implements $FeedModelCopyWith<$Res> {
  _$FeedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myData = freezed,
    Object? question = freezed,
    Object? follower = freezed,
    Object? following = freezed,
  }) {
    return _then(_value.copyWith(
      myData: freezed == myData
          ? _value.myData
          : myData // ignore: cast_nullable_to_non_nullable
              as MyData?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
      follower: freezed == follower
          ? _value.follower
          : follower // ignore: cast_nullable_to_non_nullable
              as List<MyData>?,
      following: freezed == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<MyData>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MyDataCopyWith<$Res>? get myData {
    if (_value.myData == null) {
      return null;
    }

    return $MyDataCopyWith<$Res>(_value.myData!, (value) {
      return _then(_value.copyWith(myData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FeedModelCopyWith<$Res> implements $FeedModelCopyWith<$Res> {
  factory _$$_FeedModelCopyWith(
          _$_FeedModel value, $Res Function(_$_FeedModel) then) =
      __$$_FeedModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MyData? myData,
      List<Question>? question,
      List<MyData>? follower,
      List<MyData>? following});

  @override
  $MyDataCopyWith<$Res>? get myData;
}

/// @nodoc
class __$$_FeedModelCopyWithImpl<$Res>
    extends _$FeedModelCopyWithImpl<$Res, _$_FeedModel>
    implements _$$_FeedModelCopyWith<$Res> {
  __$$_FeedModelCopyWithImpl(
      _$_FeedModel _value, $Res Function(_$_FeedModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myData = freezed,
    Object? question = freezed,
    Object? follower = freezed,
    Object? following = freezed,
  }) {
    return _then(_$_FeedModel(
      myData: freezed == myData
          ? _value.myData
          : myData // ignore: cast_nullable_to_non_nullable
              as MyData?,
      question: freezed == question
          ? _value._question
          : question // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
      follower: freezed == follower
          ? _value._follower
          : follower // ignore: cast_nullable_to_non_nullable
              as List<MyData>?,
      following: freezed == following
          ? _value._following
          : following // ignore: cast_nullable_to_non_nullable
              as List<MyData>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_FeedModel implements _FeedModel {
  const _$_FeedModel(
      {this.myData,
      final List<Question>? question,
      final List<MyData>? follower,
      final List<MyData>? following})
      : _question = question,
        _follower = follower,
        _following = following;

  factory _$_FeedModel.fromJson(Map<String, dynamic> json) =>
      _$$_FeedModelFromJson(json);

  @override
  final MyData? myData;
  final List<Question>? _question;
  @override
  List<Question>? get question {
    final value = _question;
    if (value == null) return null;
    if (_question is EqualUnmodifiableListView) return _question;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MyData>? _follower;
  @override
  List<MyData>? get follower {
    final value = _follower;
    if (value == null) return null;
    if (_follower is EqualUnmodifiableListView) return _follower;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MyData>? _following;
  @override
  List<MyData>? get following {
    final value = _following;
    if (value == null) return null;
    if (_following is EqualUnmodifiableListView) return _following;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FeedModel(myData: $myData, question: $question, follower: $follower, following: $following)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeedModel &&
            (identical(other.myData, myData) || other.myData == myData) &&
            const DeepCollectionEquality().equals(other._question, _question) &&
            const DeepCollectionEquality().equals(other._follower, _follower) &&
            const DeepCollectionEquality()
                .equals(other._following, _following));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      myData,
      const DeepCollectionEquality().hash(_question),
      const DeepCollectionEquality().hash(_follower),
      const DeepCollectionEquality().hash(_following));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeedModelCopyWith<_$_FeedModel> get copyWith =>
      __$$_FeedModelCopyWithImpl<_$_FeedModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeedModelToJson(
      this,
    );
  }
}

abstract class _FeedModel implements FeedModel {
  const factory _FeedModel(
      {final MyData? myData,
      final List<Question>? question,
      final List<MyData>? follower,
      final List<MyData>? following}) = _$_FeedModel;

  factory _FeedModel.fromJson(Map<String, dynamic> json) =
      _$_FeedModel.fromJson;

  @override
  MyData? get myData;
  @override
  List<Question>? get question;
  @override
  List<MyData>? get follower;
  @override
  List<MyData>? get following;
  @override
  @JsonKey(ignore: true)
  _$$_FeedModelCopyWith<_$_FeedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

MyData _$MyDataFromJson(Map<String, dynamic> json) {
  return _MyData.fromJson(json);
}

/// @nodoc
mixin _$MyData {
  String? get email => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get snsId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get rememberToken => throw _privateConstructorUsedError;
  String? get auth => throw _privateConstructorUsedError;
  int? get seq => throw _privateConstructorUsedError;
  dynamic? get updatedAt => throw _privateConstructorUsedError;
  dynamic? get deletedAt => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  int? get followCnt => throw _privateConstructorUsedError;
  String? get snsType => throw _privateConstructorUsedError;
  dynamic? get emailVerifiedAt => throw _privateConstructorUsedError;
  String? get userLevel => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastLogin => throw _privateConstructorUsedError;
  int? get answerCnt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyDataCopyWith<MyData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyDataCopyWith<$Res> {
  factory $MyDataCopyWith(MyData value, $Res Function(MyData) then) =
      _$MyDataCopyWithImpl<$Res, MyData>;
  @useResult
  $Res call(
      {String? email,
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
      int? answerCnt});
}

/// @nodoc
class _$MyDataCopyWithImpl<$Res, $Val extends MyData>
    implements $MyDataCopyWith<$Res> {
  _$MyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? nickname = freezed,
    Object? phoneNumber = freezed,
    Object? snsId = freezed,
    Object? status = freezed,
    Object? rememberToken = freezed,
    Object? auth = freezed,
    Object? seq = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? password = freezed,
    Object? photo = freezed,
    Object? followCnt = freezed,
    Object? snsType = freezed,
    Object? emailVerifiedAt = freezed,
    Object? userLevel = freezed,
    Object? createdAt = freezed,
    Object? lastLogin = freezed,
    Object? answerCnt = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      snsId: freezed == snsId
          ? _value.snsId
          : snsId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      rememberToken: freezed == rememberToken
          ? _value.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as String?,
      auth: freezed == auth
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as String?,
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      followCnt: freezed == followCnt
          ? _value.followCnt
          : followCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      snsType: freezed == snsType
          ? _value.snsType
          : snsType // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      userLevel: freezed == userLevel
          ? _value.userLevel
          : userLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      answerCnt: freezed == answerCnt
          ? _value.answerCnt
          : answerCnt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyDataCopyWith<$Res> implements $MyDataCopyWith<$Res> {
  factory _$$_MyDataCopyWith(_$_MyData value, $Res Function(_$_MyData) then) =
      __$$_MyDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
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
      int? answerCnt});
}

/// @nodoc
class __$$_MyDataCopyWithImpl<$Res>
    extends _$MyDataCopyWithImpl<$Res, _$_MyData>
    implements _$$_MyDataCopyWith<$Res> {
  __$$_MyDataCopyWithImpl(_$_MyData _value, $Res Function(_$_MyData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? nickname = freezed,
    Object? phoneNumber = freezed,
    Object? snsId = freezed,
    Object? status = freezed,
    Object? rememberToken = freezed,
    Object? auth = freezed,
    Object? seq = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? password = freezed,
    Object? photo = freezed,
    Object? followCnt = freezed,
    Object? snsType = freezed,
    Object? emailVerifiedAt = freezed,
    Object? userLevel = freezed,
    Object? createdAt = freezed,
    Object? lastLogin = freezed,
    Object? answerCnt = freezed,
  }) {
    return _then(_$_MyData(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      snsId: freezed == snsId
          ? _value.snsId
          : snsId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      rememberToken: freezed == rememberToken
          ? _value.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as String?,
      auth: freezed == auth
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as String?,
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      followCnt: freezed == followCnt
          ? _value.followCnt
          : followCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      snsType: freezed == snsType
          ? _value.snsType
          : snsType // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      userLevel: freezed == userLevel
          ? _value.userLevel
          : userLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      answerCnt: freezed == answerCnt
          ? _value.answerCnt
          : answerCnt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_MyData implements _MyData {
  const _$_MyData(
      {this.email,
      this.nickname,
      this.phoneNumber,
      this.snsId,
      this.status,
      this.rememberToken,
      this.auth,
      this.seq,
      this.updatedAt,
      this.deletedAt,
      this.password,
      this.photo,
      this.followCnt,
      this.snsType,
      this.emailVerifiedAt,
      this.userLevel,
      this.createdAt,
      this.lastLogin,
      this.answerCnt});

  factory _$_MyData.fromJson(Map<String, dynamic> json) =>
      _$$_MyDataFromJson(json);

  @override
  final String? email;
  @override
  final String? nickname;
  @override
  final String? phoneNumber;
  @override
  final String? snsId;
  @override
  final String? status;
  @override
  final String? rememberToken;
  @override
  final String? auth;
  @override
  final int? seq;
  @override
  final dynamic? updatedAt;
  @override
  final dynamic? deletedAt;
  @override
  final String? password;
  @override
  final String? photo;
  @override
  final int? followCnt;
  @override
  final String? snsType;
  @override
  final dynamic? emailVerifiedAt;
  @override
  final String? userLevel;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? lastLogin;
  @override
  final int? answerCnt;

  @override
  String toString() {
    return 'MyData(email: $email, nickname: $nickname, phoneNumber: $phoneNumber, snsId: $snsId, status: $status, rememberToken: $rememberToken, auth: $auth, seq: $seq, updatedAt: $updatedAt, deletedAt: $deletedAt, password: $password, photo: $photo, followCnt: $followCnt, snsType: $snsType, emailVerifiedAt: $emailVerifiedAt, userLevel: $userLevel, createdAt: $createdAt, lastLogin: $lastLogin, answerCnt: $answerCnt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyData &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.snsId, snsId) || other.snsId == snsId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.rememberToken, rememberToken) ||
                other.rememberToken == rememberToken) &&
            (identical(other.auth, auth) || other.auth == auth) &&
            (identical(other.seq, seq) || other.seq == seq) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.followCnt, followCnt) ||
                other.followCnt == followCnt) &&
            (identical(other.snsType, snsType) || other.snsType == snsType) &&
            const DeepCollectionEquality()
                .equals(other.emailVerifiedAt, emailVerifiedAt) &&
            (identical(other.userLevel, userLevel) ||
                other.userLevel == userLevel) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.answerCnt, answerCnt) ||
                other.answerCnt == answerCnt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        email,
        nickname,
        phoneNumber,
        snsId,
        status,
        rememberToken,
        auth,
        seq,
        const DeepCollectionEquality().hash(updatedAt),
        const DeepCollectionEquality().hash(deletedAt),
        password,
        photo,
        followCnt,
        snsType,
        const DeepCollectionEquality().hash(emailVerifiedAt),
        userLevel,
        createdAt,
        lastLogin,
        answerCnt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyDataCopyWith<_$_MyData> get copyWith =>
      __$$_MyDataCopyWithImpl<_$_MyData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyDataToJson(
      this,
    );
  }
}

abstract class _MyData implements MyData {
  const factory _MyData(
      {final String? email,
      final String? nickname,
      final String? phoneNumber,
      final String? snsId,
      final String? status,
      final String? rememberToken,
      final String? auth,
      final int? seq,
      final dynamic? updatedAt,
      final dynamic? deletedAt,
      final String? password,
      final String? photo,
      final int? followCnt,
      final String? snsType,
      final dynamic? emailVerifiedAt,
      final String? userLevel,
      final DateTime? createdAt,
      final DateTime? lastLogin,
      final int? answerCnt}) = _$_MyData;

  factory _MyData.fromJson(Map<String, dynamic> json) = _$_MyData.fromJson;

  @override
  String? get email;
  @override
  String? get nickname;
  @override
  String? get phoneNumber;
  @override
  String? get snsId;
  @override
  String? get status;
  @override
  String? get rememberToken;
  @override
  String? get auth;
  @override
  int? get seq;
  @override
  dynamic? get updatedAt;
  @override
  dynamic? get deletedAt;
  @override
  String? get password;
  @override
  String? get photo;
  @override
  int? get followCnt;
  @override
  String? get snsType;
  @override
  dynamic? get emailVerifiedAt;
  @override
  String? get userLevel;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get lastLogin;
  @override
  int? get answerCnt;
  @override
  @JsonKey(ignore: true)
  _$$_MyDataCopyWith<_$_MyData> get copyWith =>
      throw _privateConstructorUsedError;
}

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  int? get toSeq => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  String? get private => throw _privateConstructorUsedError;
  dynamic? get unknownName => throw _privateConstructorUsedError;
  dynamic? get updatedAt => throw _privateConstructorUsedError;
  int? get seq => throw _privateConstructorUsedError;
  int? get userSeq => throw _privateConstructorUsedError;
  String? get question => throw _privateConstructorUsedError;
  int? get likes => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  List<dynamic>? get topAnswer => throw _privateConstructorUsedError;
  List<Answer>? get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {int? toSeq,
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
      List<Answer>? answer});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toSeq = freezed,
    Object? photo = freezed,
    Object? private = freezed,
    Object? unknownName = freezed,
    Object? updatedAt = freezed,
    Object? seq = freezed,
    Object? userSeq = freezed,
    Object? question = freezed,
    Object? likes = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? topAnswer = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      toSeq: freezed == toSeq
          ? _value.toSeq
          : toSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      private: freezed == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as String?,
      unknownName: freezed == unknownName
          ? _value.unknownName
          : unknownName // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      userSeq: freezed == userSeq
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      topAnswer: freezed == topAnswer
          ? _value.topAnswer
          : topAnswer // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as List<Answer>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$$_QuestionCopyWith(
          _$_Question value, $Res Function(_$_Question) then) =
      __$$_QuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? toSeq,
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
      List<Answer>? answer});
}

/// @nodoc
class __$$_QuestionCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$_Question>
    implements _$$_QuestionCopyWith<$Res> {
  __$$_QuestionCopyWithImpl(
      _$_Question _value, $Res Function(_$_Question) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toSeq = freezed,
    Object? photo = freezed,
    Object? private = freezed,
    Object? unknownName = freezed,
    Object? updatedAt = freezed,
    Object? seq = freezed,
    Object? userSeq = freezed,
    Object? question = freezed,
    Object? likes = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? topAnswer = freezed,
    Object? answer = freezed,
  }) {
    return _then(_$_Question(
      toSeq: freezed == toSeq
          ? _value.toSeq
          : toSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      private: freezed == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as String?,
      unknownName: freezed == unknownName
          ? _value.unknownName
          : unknownName // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      userSeq: freezed == userSeq
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      topAnswer: freezed == topAnswer
          ? _value._topAnswer
          : topAnswer // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      answer: freezed == answer
          ? _value._answer
          : answer // ignore: cast_nullable_to_non_nullable
              as List<Answer>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Question implements _Question {
  const _$_Question(
      {this.toSeq,
      this.photo,
      this.private,
      this.unknownName,
      this.updatedAt,
      this.seq,
      this.userSeq,
      this.question,
      this.likes,
      this.status,
      this.createdAt,
      final List<dynamic>? topAnswer,
      final List<Answer>? answer})
      : _topAnswer = topAnswer,
        _answer = answer;

  factory _$_Question.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionFromJson(json);

  @override
  final int? toSeq;
  @override
  final String? photo;
  @override
  final String? private;
  @override
  final dynamic? unknownName;
  @override
  final dynamic? updatedAt;
  @override
  final int? seq;
  @override
  final int? userSeq;
  @override
  final String? question;
  @override
  final int? likes;
  @override
  final String? status;
  @override
  final DateTime? createdAt;
  final List<dynamic>? _topAnswer;
  @override
  List<dynamic>? get topAnswer {
    final value = _topAnswer;
    if (value == null) return null;
    if (_topAnswer is EqualUnmodifiableListView) return _topAnswer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Answer>? _answer;
  @override
  List<Answer>? get answer {
    final value = _answer;
    if (value == null) return null;
    if (_answer is EqualUnmodifiableListView) return _answer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Question(toSeq: $toSeq, photo: $photo, private: $private, unknownName: $unknownName, updatedAt: $updatedAt, seq: $seq, userSeq: $userSeq, question: $question, likes: $likes, status: $status, createdAt: $createdAt, topAnswer: $topAnswer, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Question &&
            (identical(other.toSeq, toSeq) || other.toSeq == toSeq) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.private, private) || other.private == private) &&
            const DeepCollectionEquality()
                .equals(other.unknownName, unknownName) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.userSeq, userSeq) || other.userSeq == userSeq) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._topAnswer, _topAnswer) &&
            const DeepCollectionEquality().equals(other._answer, _answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      toSeq,
      photo,
      private,
      const DeepCollectionEquality().hash(unknownName),
      const DeepCollectionEquality().hash(updatedAt),
      seq,
      userSeq,
      question,
      likes,
      status,
      createdAt,
      const DeepCollectionEquality().hash(_topAnswer),
      const DeepCollectionEquality().hash(_answer));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      __$$_QuestionCopyWithImpl<_$_Question>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  const factory _Question(
      {final int? toSeq,
      final String? photo,
      final String? private,
      final dynamic? unknownName,
      final dynamic? updatedAt,
      final int? seq,
      final int? userSeq,
      final String? question,
      final int? likes,
      final String? status,
      final DateTime? createdAt,
      final List<dynamic>? topAnswer,
      final List<Answer>? answer}) = _$_Question;

  factory _Question.fromJson(Map<String, dynamic> json) = _$_Question.fromJson;

  @override
  int? get toSeq;
  @override
  String? get photo;
  @override
  String? get private;
  @override
  dynamic? get unknownName;
  @override
  dynamic? get updatedAt;
  @override
  int? get seq;
  @override
  int? get userSeq;
  @override
  String? get question;
  @override
  int? get likes;
  @override
  String? get status;
  @override
  DateTime? get createdAt;
  @override
  List<dynamic>? get topAnswer;
  @override
  List<Answer>? get answer;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      throw _privateConstructorUsedError;
}

Answers _$AnswersFromJson(Map<String, dynamic> json) {
  return _Answers.fromJson(json);
}

/// @nodoc
mixin _$Answers {
  int? get questionSeq => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  int? get seq => throw _privateConstructorUsedError;
  int? get userSeq => throw _privateConstructorUsedError;
  String? get reply => throw _privateConstructorUsedError;
  int? get likes => throw _privateConstructorUsedError;
  dynamic? get updatedAt => throw _privateConstructorUsedError;
  int? get pSeq => throw _privateConstructorUsedError;
  List<Answer>? get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswersCopyWith<Answers> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswersCopyWith<$Res> {
  factory $AnswersCopyWith(Answers value, $Res Function(Answers) then) =
      _$AnswersCopyWithImpl<$Res, Answers>;
  @useResult
  $Res call(
      {int? questionSeq,
      String? photo,
      DateTime? createdAt,
      int? seq,
      int? userSeq,
      String? reply,
      int? likes,
      dynamic? updatedAt,
      int? pSeq,
      List<Answer>? comment});
}

/// @nodoc
class _$AnswersCopyWithImpl<$Res, $Val extends Answers>
    implements $AnswersCopyWith<$Res> {
  _$AnswersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionSeq = freezed,
    Object? photo = freezed,
    Object? createdAt = freezed,
    Object? seq = freezed,
    Object? userSeq = freezed,
    Object? reply = freezed,
    Object? likes = freezed,
    Object? updatedAt = freezed,
    Object? pSeq = freezed,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      questionSeq: freezed == questionSeq
          ? _value.questionSeq
          : questionSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      userSeq: freezed == userSeq
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      reply: freezed == reply
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      pSeq: freezed == pSeq
          ? _value.pSeq
          : pSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as List<Answer>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnswersCopyWith<$Res> implements $AnswersCopyWith<$Res> {
  factory _$$_AnswersCopyWith(
          _$_Answers value, $Res Function(_$_Answers) then) =
      __$$_AnswersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? questionSeq,
      String? photo,
      DateTime? createdAt,
      int? seq,
      int? userSeq,
      String? reply,
      int? likes,
      dynamic? updatedAt,
      int? pSeq,
      List<Answer>? comment});
}

/// @nodoc
class __$$_AnswersCopyWithImpl<$Res>
    extends _$AnswersCopyWithImpl<$Res, _$_Answers>
    implements _$$_AnswersCopyWith<$Res> {
  __$$_AnswersCopyWithImpl(_$_Answers _value, $Res Function(_$_Answers) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionSeq = freezed,
    Object? photo = freezed,
    Object? createdAt = freezed,
    Object? seq = freezed,
    Object? userSeq = freezed,
    Object? reply = freezed,
    Object? likes = freezed,
    Object? updatedAt = freezed,
    Object? pSeq = freezed,
    Object? comment = freezed,
  }) {
    return _then(_$_Answers(
      questionSeq: freezed == questionSeq
          ? _value.questionSeq
          : questionSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      userSeq: freezed == userSeq
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      reply: freezed == reply
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      pSeq: freezed == pSeq
          ? _value.pSeq
          : pSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      comment: freezed == comment
          ? _value._comment
          : comment // ignore: cast_nullable_to_non_nullable
              as List<Answer>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Answers implements _Answers {
  const _$_Answers(
      {this.questionSeq,
      this.photo,
      this.createdAt,
      this.seq,
      this.userSeq,
      this.reply,
      this.likes,
      this.updatedAt,
      this.pSeq,
      final List<Answer>? comment})
      : _comment = comment;

  factory _$_Answers.fromJson(Map<String, dynamic> json) =>
      _$$_AnswersFromJson(json);

  @override
  final int? questionSeq;
  @override
  final String? photo;
  @override
  final DateTime? createdAt;
  @override
  final int? seq;
  @override
  final int? userSeq;
  @override
  final String? reply;
  @override
  final int? likes;
  @override
  final dynamic? updatedAt;
  @override
  final int? pSeq;
  final List<Answer>? _comment;
  @override
  List<Answer>? get comment {
    final value = _comment;
    if (value == null) return null;
    if (_comment is EqualUnmodifiableListView) return _comment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Answers(questionSeq: $questionSeq, photo: $photo, createdAt: $createdAt, seq: $seq, userSeq: $userSeq, reply: $reply, likes: $likes, updatedAt: $updatedAt, pSeq: $pSeq, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Answers &&
            (identical(other.questionSeq, questionSeq) ||
                other.questionSeq == questionSeq) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.userSeq, userSeq) || other.userSeq == userSeq) &&
            (identical(other.reply, reply) || other.reply == reply) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            (identical(other.pSeq, pSeq) || other.pSeq == pSeq) &&
            const DeepCollectionEquality().equals(other._comment, _comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      questionSeq,
      photo,
      createdAt,
      seq,
      userSeq,
      reply,
      likes,
      const DeepCollectionEquality().hash(updatedAt),
      pSeq,
      const DeepCollectionEquality().hash(_comment));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnswersCopyWith<_$_Answers> get copyWith =>
      __$$_AnswersCopyWithImpl<_$_Answers>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnswersToJson(
      this,
    );
  }
}

abstract class _Answers implements Answers {
  const factory _Answers(
      {final int? questionSeq,
      final String? photo,
      final DateTime? createdAt,
      final int? seq,
      final int? userSeq,
      final String? reply,
      final int? likes,
      final dynamic? updatedAt,
      final int? pSeq,
      final List<Answer>? comment}) = _$_Answers;

  factory _Answers.fromJson(Map<String, dynamic> json) = _$_Answers.fromJson;

  @override
  int? get questionSeq;
  @override
  String? get photo;
  @override
  DateTime? get createdAt;
  @override
  int? get seq;
  @override
  int? get userSeq;
  @override
  String? get reply;
  @override
  int? get likes;
  @override
  dynamic? get updatedAt;
  @override
  int? get pSeq;
  @override
  List<Answer>? get comment;
  @override
  @JsonKey(ignore: true)
  _$$_AnswersCopyWith<_$_Answers> get copyWith =>
      throw _privateConstructorUsedError;
}

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
mixin _$Answer {
  @JsonKey(name: 'Users')
  MyData? get users => throw _privateConstructorUsedError;
  @JsonKey(name: 'Answers')
  Answers? get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res, Answer>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Users') MyData? users,
      @JsonKey(name: 'Answers') Answers? answers});

  $MyDataCopyWith<$Res>? get users;
  $AnswersCopyWith<$Res>? get answers;
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res, $Val extends Answer>
    implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
    Object? answers = freezed,
  }) {
    return _then(_value.copyWith(
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as MyData?,
      answers: freezed == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Answers?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MyDataCopyWith<$Res>? get users {
    if (_value.users == null) {
      return null;
    }

    return $MyDataCopyWith<$Res>(_value.users!, (value) {
      return _then(_value.copyWith(users: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AnswersCopyWith<$Res>? get answers {
    if (_value.answers == null) {
      return null;
    }

    return $AnswersCopyWith<$Res>(_value.answers!, (value) {
      return _then(_value.copyWith(answers: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AnswerCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$_AnswerCopyWith(_$_Answer value, $Res Function(_$_Answer) then) =
      __$$_AnswerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Users') MyData? users,
      @JsonKey(name: 'Answers') Answers? answers});

  @override
  $MyDataCopyWith<$Res>? get users;
  @override
  $AnswersCopyWith<$Res>? get answers;
}

/// @nodoc
class __$$_AnswerCopyWithImpl<$Res>
    extends _$AnswerCopyWithImpl<$Res, _$_Answer>
    implements _$$_AnswerCopyWith<$Res> {
  __$$_AnswerCopyWithImpl(_$_Answer _value, $Res Function(_$_Answer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
    Object? answers = freezed,
  }) {
    return _then(_$_Answer(
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as MyData?,
      answers: freezed == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Answers?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Answer implements _Answer {
  const _$_Answer(
      {@JsonKey(name: 'Users') this.users,
      @JsonKey(name: 'Answers') this.answers});

  factory _$_Answer.fromJson(Map<String, dynamic> json) =>
      _$$_AnswerFromJson(json);

  @override
  @JsonKey(name: 'Users')
  final MyData? users;
  @override
  @JsonKey(name: 'Answers')
  final Answers? answers;

  @override
  String toString() {
    return 'Answer(users: $users, answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Answer &&
            (identical(other.users, users) || other.users == users) &&
            (identical(other.answers, answers) || other.answers == answers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, users, answers);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      __$$_AnswerCopyWithImpl<_$_Answer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnswerToJson(
      this,
    );
  }
}

abstract class _Answer implements Answer {
  const factory _Answer(
      {@JsonKey(name: 'Users') final MyData? users,
      @JsonKey(name: 'Answers') final Answers? answers}) = _$_Answer;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$_Answer.fromJson;

  @override
  @JsonKey(name: 'Users')
  MyData? get users;
  @override
  @JsonKey(name: 'Answers')
  Answers? get answers;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      throw _privateConstructorUsedError;
}
