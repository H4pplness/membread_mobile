// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userscore_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserScoreDTO _$UserScoreDTOFromJson(Map<String, dynamic> json) {
  return _UserScoreDTO.fromJson(json);
}

/// @nodoc
mixin _$UserScoreDTO {
  int? get score => throw _privateConstructorUsedError;
  GetUserInfoDTO? get userInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserScoreDTOCopyWith<UserScoreDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserScoreDTOCopyWith<$Res> {
  factory $UserScoreDTOCopyWith(
          UserScoreDTO value, $Res Function(UserScoreDTO) then) =
      _$UserScoreDTOCopyWithImpl<$Res, UserScoreDTO>;
  @useResult
  $Res call({int? score, GetUserInfoDTO? userInfo});

  $GetUserInfoDTOCopyWith<$Res>? get userInfo;
}

/// @nodoc
class _$UserScoreDTOCopyWithImpl<$Res, $Val extends UserScoreDTO>
    implements $UserScoreDTOCopyWith<$Res> {
  _$UserScoreDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = freezed,
    Object? userInfo = freezed,
  }) {
    return _then(_value.copyWith(
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as GetUserInfoDTO?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GetUserInfoDTOCopyWith<$Res>? get userInfo {
    if (_value.userInfo == null) {
      return null;
    }

    return $GetUserInfoDTOCopyWith<$Res>(_value.userInfo!, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserScoreDTOImplCopyWith<$Res>
    implements $UserScoreDTOCopyWith<$Res> {
  factory _$$UserScoreDTOImplCopyWith(
          _$UserScoreDTOImpl value, $Res Function(_$UserScoreDTOImpl) then) =
      __$$UserScoreDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? score, GetUserInfoDTO? userInfo});

  @override
  $GetUserInfoDTOCopyWith<$Res>? get userInfo;
}

/// @nodoc
class __$$UserScoreDTOImplCopyWithImpl<$Res>
    extends _$UserScoreDTOCopyWithImpl<$Res, _$UserScoreDTOImpl>
    implements _$$UserScoreDTOImplCopyWith<$Res> {
  __$$UserScoreDTOImplCopyWithImpl(
      _$UserScoreDTOImpl _value, $Res Function(_$UserScoreDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = freezed,
    Object? userInfo = freezed,
  }) {
    return _then(_$UserScoreDTOImpl(
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as GetUserInfoDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserScoreDTOImpl implements _UserScoreDTO {
  const _$UserScoreDTOImpl({this.score, this.userInfo});

  factory _$UserScoreDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserScoreDTOImplFromJson(json);

  @override
  final int? score;
  @override
  final GetUserInfoDTO? userInfo;

  @override
  String toString() {
    return 'UserScoreDTO(score: $score, userInfo: $userInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserScoreDTOImpl &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, score, userInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserScoreDTOImplCopyWith<_$UserScoreDTOImpl> get copyWith =>
      __$$UserScoreDTOImplCopyWithImpl<_$UserScoreDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserScoreDTOImplToJson(
      this,
    );
  }
}

abstract class _UserScoreDTO implements UserScoreDTO {
  const factory _UserScoreDTO(
      {final int? score, final GetUserInfoDTO? userInfo}) = _$UserScoreDTOImpl;

  factory _UserScoreDTO.fromJson(Map<String, dynamic> json) =
      _$UserScoreDTOImpl.fromJson;

  @override
  int? get score;
  @override
  GetUserInfoDTO? get userInfo;
  @override
  @JsonKey(ignore: true)
  _$$UserScoreDTOImplCopyWith<_$UserScoreDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
