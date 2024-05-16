// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lessoninfodto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonInfoDTO _$LessonInfoDTOFromJson(Map<String, dynamic> json) {
  return _LessonDTO.fromJson(json);
}

/// @nodoc
mixin _$LessonInfoDTO {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonInfoDTOCopyWith<LessonInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonInfoDTOCopyWith<$Res> {
  factory $LessonInfoDTOCopyWith(
          LessonInfoDTO value, $Res Function(LessonInfoDTO) then) =
      _$LessonInfoDTOCopyWithImpl<$Res, LessonInfoDTO>;
  @useResult
  $Res call({int? id, String? title, String? description});
}

/// @nodoc
class _$LessonInfoDTOCopyWithImpl<$Res, $Val extends LessonInfoDTO>
    implements $LessonInfoDTOCopyWith<$Res> {
  _$LessonInfoDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonDTOImplCopyWith<$Res>
    implements $LessonInfoDTOCopyWith<$Res> {
  factory _$$LessonDTOImplCopyWith(
          _$LessonDTOImpl value, $Res Function(_$LessonDTOImpl) then) =
      __$$LessonDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? title, String? description});
}

/// @nodoc
class __$$LessonDTOImplCopyWithImpl<$Res>
    extends _$LessonInfoDTOCopyWithImpl<$Res, _$LessonDTOImpl>
    implements _$$LessonDTOImplCopyWith<$Res> {
  __$$LessonDTOImplCopyWithImpl(
      _$LessonDTOImpl _value, $Res Function(_$LessonDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_$LessonDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonDTOImpl implements _LessonDTO {
  const _$LessonDTOImpl({this.id, this.title, this.description});

  factory _$LessonDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonDTOImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? description;

  @override
  String toString() {
    return 'LessonInfoDTO(id: $id, title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonDTOImplCopyWith<_$LessonDTOImpl> get copyWith =>
      __$$LessonDTOImplCopyWithImpl<_$LessonDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonDTOImplToJson(
      this,
    );
  }
}

abstract class _LessonDTO implements LessonInfoDTO {
  const factory _LessonDTO(
      {final int? id,
      final String? title,
      final String? description}) = _$LessonDTOImpl;

  factory _LessonDTO.fromJson(Map<String, dynamic> json) =
      _$LessonDTOImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$LessonDTOImplCopyWith<_$LessonDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
