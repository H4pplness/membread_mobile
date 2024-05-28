// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'getcourseinfodto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetCourseInfoDTO _$GetCourseInfoDTOFromJson(Map<String, dynamic> json) {
  return _GetCourseInfoDTO.fromJson(json);
}

/// @nodoc
mixin _$GetCourseInfoDTO {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<LessonInfoDTO>? get listLesson => throw _privateConstructorUsedError;
  int? get currentLesson => throw _privateConstructorUsedError;
  GetUserInfoDTO? get author => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetCourseInfoDTOCopyWith<GetCourseInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCourseInfoDTOCopyWith<$Res> {
  factory $GetCourseInfoDTOCopyWith(
          GetCourseInfoDTO value, $Res Function(GetCourseInfoDTO) then) =
      _$GetCourseInfoDTOCopyWithImpl<$Res, GetCourseInfoDTO>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? description,
      List<LessonInfoDTO>? listLesson,
      int? currentLesson,
      GetUserInfoDTO? author});

  $GetUserInfoDTOCopyWith<$Res>? get author;
}

/// @nodoc
class _$GetCourseInfoDTOCopyWithImpl<$Res, $Val extends GetCourseInfoDTO>
    implements $GetCourseInfoDTOCopyWith<$Res> {
  _$GetCourseInfoDTOCopyWithImpl(this._value, this._then);

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
    Object? listLesson = freezed,
    Object? currentLesson = freezed,
    Object? author = freezed,
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
      listLesson: freezed == listLesson
          ? _value.listLesson
          : listLesson // ignore: cast_nullable_to_non_nullable
              as List<LessonInfoDTO>?,
      currentLesson: freezed == currentLesson
          ? _value.currentLesson
          : currentLesson // ignore: cast_nullable_to_non_nullable
              as int?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as GetUserInfoDTO?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GetUserInfoDTOCopyWith<$Res>? get author {
    if (_value.author == null) {
      return null;
    }

    return $GetUserInfoDTOCopyWith<$Res>(_value.author!, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetCourseInfoDTOImplCopyWith<$Res>
    implements $GetCourseInfoDTOCopyWith<$Res> {
  factory _$$GetCourseInfoDTOImplCopyWith(_$GetCourseInfoDTOImpl value,
          $Res Function(_$GetCourseInfoDTOImpl) then) =
      __$$GetCourseInfoDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? description,
      List<LessonInfoDTO>? listLesson,
      int? currentLesson,
      GetUserInfoDTO? author});

  @override
  $GetUserInfoDTOCopyWith<$Res>? get author;
}

/// @nodoc
class __$$GetCourseInfoDTOImplCopyWithImpl<$Res>
    extends _$GetCourseInfoDTOCopyWithImpl<$Res, _$GetCourseInfoDTOImpl>
    implements _$$GetCourseInfoDTOImplCopyWith<$Res> {
  __$$GetCourseInfoDTOImplCopyWithImpl(_$GetCourseInfoDTOImpl _value,
      $Res Function(_$GetCourseInfoDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? listLesson = freezed,
    Object? currentLesson = freezed,
    Object? author = freezed,
  }) {
    return _then(_$GetCourseInfoDTOImpl(
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
      listLesson: freezed == listLesson
          ? _value._listLesson
          : listLesson // ignore: cast_nullable_to_non_nullable
              as List<LessonInfoDTO>?,
      currentLesson: freezed == currentLesson
          ? _value.currentLesson
          : currentLesson // ignore: cast_nullable_to_non_nullable
              as int?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as GetUserInfoDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetCourseInfoDTOImpl implements _GetCourseInfoDTO {
  const _$GetCourseInfoDTOImpl(
      {this.id,
      this.title,
      this.description,
      final List<LessonInfoDTO>? listLesson,
      this.currentLesson,
      this.author})
      : _listLesson = listLesson;

  factory _$GetCourseInfoDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetCourseInfoDTOImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? description;
  final List<LessonInfoDTO>? _listLesson;
  @override
  List<LessonInfoDTO>? get listLesson {
    final value = _listLesson;
    if (value == null) return null;
    if (_listLesson is EqualUnmodifiableListView) return _listLesson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? currentLesson;
  @override
  final GetUserInfoDTO? author;

  @override
  String toString() {
    return 'GetCourseInfoDTO(id: $id, title: $title, description: $description, listLesson: $listLesson, currentLesson: $currentLesson, author: $author)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCourseInfoDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._listLesson, _listLesson) &&
            (identical(other.currentLesson, currentLesson) ||
                other.currentLesson == currentLesson) &&
            (identical(other.author, author) || other.author == author));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      const DeepCollectionEquality().hash(_listLesson), currentLesson, author);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCourseInfoDTOImplCopyWith<_$GetCourseInfoDTOImpl> get copyWith =>
      __$$GetCourseInfoDTOImplCopyWithImpl<_$GetCourseInfoDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetCourseInfoDTOImplToJson(
      this,
    );
  }
}

abstract class _GetCourseInfoDTO implements GetCourseInfoDTO {
  const factory _GetCourseInfoDTO(
      {final int? id,
      final String? title,
      final String? description,
      final List<LessonInfoDTO>? listLesson,
      final int? currentLesson,
      final GetUserInfoDTO? author}) = _$GetCourseInfoDTOImpl;

  factory _GetCourseInfoDTO.fromJson(Map<String, dynamic> json) =
      _$GetCourseInfoDTOImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  List<LessonInfoDTO>? get listLesson;
  @override
  int? get currentLesson;
  @override
  GetUserInfoDTO? get author;
  @override
  @JsonKey(ignore: true)
  _$$GetCourseInfoDTOImplCopyWith<_$GetCourseInfoDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
