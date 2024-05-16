// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'createcoursedto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateCourseDTO _$CreateCourseDTOFromJson(Map<String, dynamic> json) {
  return _CreateCourseDTO.fromJson(json);
}

/// @nodoc
mixin _$CreateCourseDTO {
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get author_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateCourseDTOCopyWith<CreateCourseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCourseDTOCopyWith<$Res> {
  factory $CreateCourseDTOCopyWith(
          CreateCourseDTO value, $Res Function(CreateCourseDTO) then) =
      _$CreateCourseDTOCopyWithImpl<$Res, CreateCourseDTO>;
  @useResult
  $Res call({String title, String? description, int? author_id});
}

/// @nodoc
class _$CreateCourseDTOCopyWithImpl<$Res, $Val extends CreateCourseDTO>
    implements $CreateCourseDTOCopyWith<$Res> {
  _$CreateCourseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? author_id = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      author_id: freezed == author_id
          ? _value.author_id
          : author_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateCourseDTOImplCopyWith<$Res>
    implements $CreateCourseDTOCopyWith<$Res> {
  factory _$$CreateCourseDTOImplCopyWith(_$CreateCourseDTOImpl value,
          $Res Function(_$CreateCourseDTOImpl) then) =
      __$$CreateCourseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String? description, int? author_id});
}

/// @nodoc
class __$$CreateCourseDTOImplCopyWithImpl<$Res>
    extends _$CreateCourseDTOCopyWithImpl<$Res, _$CreateCourseDTOImpl>
    implements _$$CreateCourseDTOImplCopyWith<$Res> {
  __$$CreateCourseDTOImplCopyWithImpl(
      _$CreateCourseDTOImpl _value, $Res Function(_$CreateCourseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? author_id = freezed,
  }) {
    return _then(_$CreateCourseDTOImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      author_id: freezed == author_id
          ? _value.author_id
          : author_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateCourseDTOImpl implements _CreateCourseDTO {
  const _$CreateCourseDTOImpl(
      {required this.title, this.description, this.author_id});

  factory _$CreateCourseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateCourseDTOImplFromJson(json);

  @override
  final String title;
  @override
  final String? description;
  @override
  final int? author_id;

  @override
  String toString() {
    return 'CreateCourseDTO(title: $title, description: $description, author_id: $author_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCourseDTOImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.author_id, author_id) ||
                other.author_id == author_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, author_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCourseDTOImplCopyWith<_$CreateCourseDTOImpl> get copyWith =>
      __$$CreateCourseDTOImplCopyWithImpl<_$CreateCourseDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateCourseDTOImplToJson(
      this,
    );
  }
}

abstract class _CreateCourseDTO implements CreateCourseDTO {
  const factory _CreateCourseDTO(
      {required final String title,
      final String? description,
      final int? author_id}) = _$CreateCourseDTOImpl;

  factory _CreateCourseDTO.fromJson(Map<String, dynamic> json) =
      _$CreateCourseDTOImpl.fromJson;

  @override
  String get title;
  @override
  String? get description;
  @override
  int? get author_id;
  @override
  @JsonKey(ignore: true)
  _$$CreateCourseDTOImplCopyWith<_$CreateCourseDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
