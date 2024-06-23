// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'updateuserinfodto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateUserInfoDTO _$UpdateUserInfoDTOFromJson(Map<String, dynamic> json) {
  return _UpdateUserInfoDTO.fromJson(json);
}

/// @nodoc
mixin _$UpdateUserInfoDTO {
  String? get userName => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateUserInfoDTOCopyWith<UpdateUserInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserInfoDTOCopyWith<$Res> {
  factory $UpdateUserInfoDTOCopyWith(
          UpdateUserInfoDTO value, $Res Function(UpdateUserInfoDTO) then) =
      _$UpdateUserInfoDTOCopyWithImpl<$Res, UpdateUserInfoDTO>;
  @useResult
  $Res call({String? userName, String? firstName, String? lastName});
}

/// @nodoc
class _$UpdateUserInfoDTOCopyWithImpl<$Res, $Val extends UpdateUserInfoDTO>
    implements $UpdateUserInfoDTOCopyWith<$Res> {
  _$UpdateUserInfoDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_value.copyWith(
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateUserInfoDTOImplCopyWith<$Res>
    implements $UpdateUserInfoDTOCopyWith<$Res> {
  factory _$$UpdateUserInfoDTOImplCopyWith(_$UpdateUserInfoDTOImpl value,
          $Res Function(_$UpdateUserInfoDTOImpl) then) =
      __$$UpdateUserInfoDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? userName, String? firstName, String? lastName});
}

/// @nodoc
class __$$UpdateUserInfoDTOImplCopyWithImpl<$Res>
    extends _$UpdateUserInfoDTOCopyWithImpl<$Res, _$UpdateUserInfoDTOImpl>
    implements _$$UpdateUserInfoDTOImplCopyWith<$Res> {
  __$$UpdateUserInfoDTOImplCopyWithImpl(_$UpdateUserInfoDTOImpl _value,
      $Res Function(_$UpdateUserInfoDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_$UpdateUserInfoDTOImpl(
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateUserInfoDTOImpl implements _UpdateUserInfoDTO {
  const _$UpdateUserInfoDTOImpl({this.userName, this.firstName, this.lastName});

  factory _$UpdateUserInfoDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateUserInfoDTOImplFromJson(json);

  @override
  final String? userName;
  @override
  final String? firstName;
  @override
  final String? lastName;

  @override
  String toString() {
    return 'UpdateUserInfoDTO(userName: $userName, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserInfoDTOImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userName, firstName, lastName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserInfoDTOImplCopyWith<_$UpdateUserInfoDTOImpl> get copyWith =>
      __$$UpdateUserInfoDTOImplCopyWithImpl<_$UpdateUserInfoDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateUserInfoDTOImplToJson(
      this,
    );
  }
}

abstract class _UpdateUserInfoDTO implements UpdateUserInfoDTO {
  const factory _UpdateUserInfoDTO(
      {final String? userName,
      final String? firstName,
      final String? lastName}) = _$UpdateUserInfoDTOImpl;

  factory _UpdateUserInfoDTO.fromJson(Map<String, dynamic> json) =
      _$UpdateUserInfoDTOImpl.fromJson;

  @override
  String? get userName;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  @JsonKey(ignore: true)
  _$$UpdateUserInfoDTOImplCopyWith<_$UpdateUserInfoDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
