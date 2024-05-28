// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'getuserinfodto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetUserInfoDTO _$GetUserInfoDTOFromJson(Map<String, dynamic> json) {
  return _GetUserInfoDTO.fromJson(json);
}

/// @nodoc
mixin _$GetUserInfoDTO {
  String? get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUserInfoDTOCopyWith<GetUserInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserInfoDTOCopyWith<$Res> {
  factory $GetUserInfoDTOCopyWith(
          GetUserInfoDTO value, $Res Function(GetUserInfoDTO) then) =
      _$GetUserInfoDTOCopyWithImpl<$Res, GetUserInfoDTO>;
  @useResult
  $Res call({String? id, String? firstName, String? lastName, String? avatar});
}

/// @nodoc
class _$GetUserInfoDTOCopyWithImpl<$Res, $Val extends GetUserInfoDTO>
    implements $GetUserInfoDTOCopyWith<$Res> {
  _$GetUserInfoDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetUserInfoDTOImplCopyWith<$Res>
    implements $GetUserInfoDTOCopyWith<$Res> {
  factory _$$GetUserInfoDTOImplCopyWith(_$GetUserInfoDTOImpl value,
          $Res Function(_$GetUserInfoDTOImpl) then) =
      __$$GetUserInfoDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? firstName, String? lastName, String? avatar});
}

/// @nodoc
class __$$GetUserInfoDTOImplCopyWithImpl<$Res>
    extends _$GetUserInfoDTOCopyWithImpl<$Res, _$GetUserInfoDTOImpl>
    implements _$$GetUserInfoDTOImplCopyWith<$Res> {
  __$$GetUserInfoDTOImplCopyWithImpl(
      _$GetUserInfoDTOImpl _value, $Res Function(_$GetUserInfoDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_$GetUserInfoDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUserInfoDTOImpl implements _GetUserInfoDTO {
  const _$GetUserInfoDTOImpl(
      {this.id, this.firstName, this.lastName, this.avatar});

  factory _$GetUserInfoDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUserInfoDTOImplFromJson(json);

  @override
  final String? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'GetUserInfoDTO(id: $id, firstName: $firstName, lastName: $lastName, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserInfoDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserInfoDTOImplCopyWith<_$GetUserInfoDTOImpl> get copyWith =>
      __$$GetUserInfoDTOImplCopyWithImpl<_$GetUserInfoDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUserInfoDTOImplToJson(
      this,
    );
  }
}

abstract class _GetUserInfoDTO implements GetUserInfoDTO {
  const factory _GetUserInfoDTO(
      {final String? id,
      final String? firstName,
      final String? lastName,
      final String? avatar}) = _$GetUserInfoDTOImpl;

  factory _GetUserInfoDTO.fromJson(Map<String, dynamic> json) =
      _$GetUserInfoDTOImpl.fromJson;

  @override
  String? get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get avatar;
  @override
  @JsonKey(ignore: true)
  _$$GetUserInfoDTOImplCopyWith<_$GetUserInfoDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
