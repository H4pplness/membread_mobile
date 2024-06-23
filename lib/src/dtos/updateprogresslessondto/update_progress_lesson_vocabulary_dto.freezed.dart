// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_progress_lesson_vocabulary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateProgressLessonVocabularyDTO _$UpdateProgressLessonVocabularyDTOFromJson(
    Map<String, dynamic> json) {
  return _UpdateProgressLessonVocabularyDTO.fromJson(json);
}

/// @nodoc
mixin _$UpdateProgressLessonVocabularyDTO {
  int get score => throw _privateConstructorUsedError;
  List<ProgressVocabularyDTO> get listVocabulary =>
      throw _privateConstructorUsedError;
  int? get course_id => throw _privateConstructorUsedError;
  int? get lesson_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateProgressLessonVocabularyDTOCopyWith<UpdateProgressLessonVocabularyDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProgressLessonVocabularyDTOCopyWith<$Res> {
  factory $UpdateProgressLessonVocabularyDTOCopyWith(
          UpdateProgressLessonVocabularyDTO value,
          $Res Function(UpdateProgressLessonVocabularyDTO) then) =
      _$UpdateProgressLessonVocabularyDTOCopyWithImpl<$Res,
          UpdateProgressLessonVocabularyDTO>;
  @useResult
  $Res call(
      {int score,
      List<ProgressVocabularyDTO> listVocabulary,
      int? course_id,
      int? lesson_id});
}

/// @nodoc
class _$UpdateProgressLessonVocabularyDTOCopyWithImpl<$Res,
        $Val extends UpdateProgressLessonVocabularyDTO>
    implements $UpdateProgressLessonVocabularyDTOCopyWith<$Res> {
  _$UpdateProgressLessonVocabularyDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? listVocabulary = null,
    Object? course_id = freezed,
    Object? lesson_id = freezed,
  }) {
    return _then(_value.copyWith(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      listVocabulary: null == listVocabulary
          ? _value.listVocabulary
          : listVocabulary // ignore: cast_nullable_to_non_nullable
              as List<ProgressVocabularyDTO>,
      course_id: freezed == course_id
          ? _value.course_id
          : course_id // ignore: cast_nullable_to_non_nullable
              as int?,
      lesson_id: freezed == lesson_id
          ? _value.lesson_id
          : lesson_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateProgressLessonVocabularyDTOImplCopyWith<$Res>
    implements $UpdateProgressLessonVocabularyDTOCopyWith<$Res> {
  factory _$$UpdateProgressLessonVocabularyDTOImplCopyWith(
          _$UpdateProgressLessonVocabularyDTOImpl value,
          $Res Function(_$UpdateProgressLessonVocabularyDTOImpl) then) =
      __$$UpdateProgressLessonVocabularyDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int score,
      List<ProgressVocabularyDTO> listVocabulary,
      int? course_id,
      int? lesson_id});
}

/// @nodoc
class __$$UpdateProgressLessonVocabularyDTOImplCopyWithImpl<$Res>
    extends _$UpdateProgressLessonVocabularyDTOCopyWithImpl<$Res,
        _$UpdateProgressLessonVocabularyDTOImpl>
    implements _$$UpdateProgressLessonVocabularyDTOImplCopyWith<$Res> {
  __$$UpdateProgressLessonVocabularyDTOImplCopyWithImpl(
      _$UpdateProgressLessonVocabularyDTOImpl _value,
      $Res Function(_$UpdateProgressLessonVocabularyDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? listVocabulary = null,
    Object? course_id = freezed,
    Object? lesson_id = freezed,
  }) {
    return _then(_$UpdateProgressLessonVocabularyDTOImpl(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      listVocabulary: null == listVocabulary
          ? _value._listVocabulary
          : listVocabulary // ignore: cast_nullable_to_non_nullable
              as List<ProgressVocabularyDTO>,
      course_id: freezed == course_id
          ? _value.course_id
          : course_id // ignore: cast_nullable_to_non_nullable
              as int?,
      lesson_id: freezed == lesson_id
          ? _value.lesson_id
          : lesson_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateProgressLessonVocabularyDTOImpl
    implements _UpdateProgressLessonVocabularyDTO {
  const _$UpdateProgressLessonVocabularyDTOImpl(
      {this.score = 0,
      final List<ProgressVocabularyDTO> listVocabulary = const [],
      this.course_id,
      this.lesson_id})
      : _listVocabulary = listVocabulary;

  factory _$UpdateProgressLessonVocabularyDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdateProgressLessonVocabularyDTOImplFromJson(json);

  @override
  @JsonKey()
  final int score;
  final List<ProgressVocabularyDTO> _listVocabulary;
  @override
  @JsonKey()
  List<ProgressVocabularyDTO> get listVocabulary {
    if (_listVocabulary is EqualUnmodifiableListView) return _listVocabulary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listVocabulary);
  }

  @override
  final int? course_id;
  @override
  final int? lesson_id;

  @override
  String toString() {
    return 'UpdateProgressLessonVocabularyDTO(score: $score, listVocabulary: $listVocabulary, course_id: $course_id, lesson_id: $lesson_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProgressLessonVocabularyDTOImpl &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality()
                .equals(other._listVocabulary, _listVocabulary) &&
            (identical(other.course_id, course_id) ||
                other.course_id == course_id) &&
            (identical(other.lesson_id, lesson_id) ||
                other.lesson_id == lesson_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      score,
      const DeepCollectionEquality().hash(_listVocabulary),
      course_id,
      lesson_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProgressLessonVocabularyDTOImplCopyWith<
          _$UpdateProgressLessonVocabularyDTOImpl>
      get copyWith => __$$UpdateProgressLessonVocabularyDTOImplCopyWithImpl<
          _$UpdateProgressLessonVocabularyDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateProgressLessonVocabularyDTOImplToJson(
      this,
    );
  }
}

abstract class _UpdateProgressLessonVocabularyDTO
    implements UpdateProgressLessonVocabularyDTO {
  const factory _UpdateProgressLessonVocabularyDTO(
      {final int score,
      final List<ProgressVocabularyDTO> listVocabulary,
      final int? course_id,
      final int? lesson_id}) = _$UpdateProgressLessonVocabularyDTOImpl;

  factory _UpdateProgressLessonVocabularyDTO.fromJson(
          Map<String, dynamic> json) =
      _$UpdateProgressLessonVocabularyDTOImpl.fromJson;

  @override
  int get score;
  @override
  List<ProgressVocabularyDTO> get listVocabulary;
  @override
  int? get course_id;
  @override
  int? get lesson_id;
  @override
  @JsonKey(ignore: true)
  _$$UpdateProgressLessonVocabularyDTOImplCopyWith<
          _$UpdateProgressLessonVocabularyDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
