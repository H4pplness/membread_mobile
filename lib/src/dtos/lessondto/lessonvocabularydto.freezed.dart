// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lessonvocabularydto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonVocabularyDTO _$LessonVocabularyDTOFromJson(Map<String, dynamic> json) {
  return _LessonVocabularyDTO.fromJson(json);
}

/// @nodoc
mixin _$LessonVocabularyDTO {
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<VocabularyDTO>? get listVocabulary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonVocabularyDTOCopyWith<LessonVocabularyDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonVocabularyDTOCopyWith<$Res> {
  factory $LessonVocabularyDTOCopyWith(
          LessonVocabularyDTO value, $Res Function(LessonVocabularyDTO) then) =
      _$LessonVocabularyDTOCopyWithImpl<$Res, LessonVocabularyDTO>;
  @useResult
  $Res call(
      {String title, String? description, List<VocabularyDTO>? listVocabulary});
}

/// @nodoc
class _$LessonVocabularyDTOCopyWithImpl<$Res, $Val extends LessonVocabularyDTO>
    implements $LessonVocabularyDTOCopyWith<$Res> {
  _$LessonVocabularyDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? listVocabulary = freezed,
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
      listVocabulary: freezed == listVocabulary
          ? _value.listVocabulary
          : listVocabulary // ignore: cast_nullable_to_non_nullable
              as List<VocabularyDTO>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonVocabularyDTOImplCopyWith<$Res>
    implements $LessonVocabularyDTOCopyWith<$Res> {
  factory _$$LessonVocabularyDTOImplCopyWith(_$LessonVocabularyDTOImpl value,
          $Res Function(_$LessonVocabularyDTOImpl) then) =
      __$$LessonVocabularyDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, String? description, List<VocabularyDTO>? listVocabulary});
}

/// @nodoc
class __$$LessonVocabularyDTOImplCopyWithImpl<$Res>
    extends _$LessonVocabularyDTOCopyWithImpl<$Res, _$LessonVocabularyDTOImpl>
    implements _$$LessonVocabularyDTOImplCopyWith<$Res> {
  __$$LessonVocabularyDTOImplCopyWithImpl(_$LessonVocabularyDTOImpl _value,
      $Res Function(_$LessonVocabularyDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? listVocabulary = freezed,
  }) {
    return _then(_$LessonVocabularyDTOImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      listVocabulary: freezed == listVocabulary
          ? _value._listVocabulary
          : listVocabulary // ignore: cast_nullable_to_non_nullable
              as List<VocabularyDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonVocabularyDTOImpl implements _LessonVocabularyDTO {
  const _$LessonVocabularyDTOImpl(
      {required this.title,
      this.description,
      final List<VocabularyDTO>? listVocabulary})
      : _listVocabulary = listVocabulary;

  factory _$LessonVocabularyDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonVocabularyDTOImplFromJson(json);

  @override
  final String title;
  @override
  final String? description;
  final List<VocabularyDTO>? _listVocabulary;
  @override
  List<VocabularyDTO>? get listVocabulary {
    final value = _listVocabulary;
    if (value == null) return null;
    if (_listVocabulary is EqualUnmodifiableListView) return _listVocabulary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LessonVocabularyDTO(title: $title, description: $description, listVocabulary: $listVocabulary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonVocabularyDTOImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._listVocabulary, _listVocabulary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description,
      const DeepCollectionEquality().hash(_listVocabulary));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonVocabularyDTOImplCopyWith<_$LessonVocabularyDTOImpl> get copyWith =>
      __$$LessonVocabularyDTOImplCopyWithImpl<_$LessonVocabularyDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonVocabularyDTOImplToJson(
      this,
    );
  }
}

abstract class _LessonVocabularyDTO implements LessonVocabularyDTO {
  const factory _LessonVocabularyDTO(
      {required final String title,
      final String? description,
      final List<VocabularyDTO>? listVocabulary}) = _$LessonVocabularyDTOImpl;

  factory _LessonVocabularyDTO.fromJson(Map<String, dynamic> json) =
      _$LessonVocabularyDTOImpl.fromJson;

  @override
  String get title;
  @override
  String? get description;
  @override
  List<VocabularyDTO>? get listVocabulary;
  @override
  @JsonKey(ignore: true)
  _$$LessonVocabularyDTOImplCopyWith<_$LessonVocabularyDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
