// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_vocabulary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProgressVocabularyDTO _$ProgressVocabularyDTOFromJson(
    Map<String, dynamic> json) {
  return _ProgressVocabularyDTO.fromJson(json);
}

/// @nodoc
mixin _$ProgressVocabularyDTO {
  int get learning_id => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;
  bool get need_to_review => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgressVocabularyDTOCopyWith<ProgressVocabularyDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressVocabularyDTOCopyWith<$Res> {
  factory $ProgressVocabularyDTOCopyWith(ProgressVocabularyDTO value,
          $Res Function(ProgressVocabularyDTO) then) =
      _$ProgressVocabularyDTOCopyWithImpl<$Res, ProgressVocabularyDTO>;
  @useResult
  $Res call({int learning_id, int progress, bool need_to_review});
}

/// @nodoc
class _$ProgressVocabularyDTOCopyWithImpl<$Res,
        $Val extends ProgressVocabularyDTO>
    implements $ProgressVocabularyDTOCopyWith<$Res> {
  _$ProgressVocabularyDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? learning_id = null,
    Object? progress = null,
    Object? need_to_review = null,
  }) {
    return _then(_value.copyWith(
      learning_id: null == learning_id
          ? _value.learning_id
          : learning_id // ignore: cast_nullable_to_non_nullable
              as int,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      need_to_review: null == need_to_review
          ? _value.need_to_review
          : need_to_review // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgressVocabularyDTOImplCopyWith<$Res>
    implements $ProgressVocabularyDTOCopyWith<$Res> {
  factory _$$ProgressVocabularyDTOImplCopyWith(
          _$ProgressVocabularyDTOImpl value,
          $Res Function(_$ProgressVocabularyDTOImpl) then) =
      __$$ProgressVocabularyDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int learning_id, int progress, bool need_to_review});
}

/// @nodoc
class __$$ProgressVocabularyDTOImplCopyWithImpl<$Res>
    extends _$ProgressVocabularyDTOCopyWithImpl<$Res,
        _$ProgressVocabularyDTOImpl>
    implements _$$ProgressVocabularyDTOImplCopyWith<$Res> {
  __$$ProgressVocabularyDTOImplCopyWithImpl(_$ProgressVocabularyDTOImpl _value,
      $Res Function(_$ProgressVocabularyDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? learning_id = null,
    Object? progress = null,
    Object? need_to_review = null,
  }) {
    return _then(_$ProgressVocabularyDTOImpl(
      learning_id: null == learning_id
          ? _value.learning_id
          : learning_id // ignore: cast_nullable_to_non_nullable
              as int,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      need_to_review: null == need_to_review
          ? _value.need_to_review
          : need_to_review // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgressVocabularyDTOImpl implements _ProgressVocabularyDTO {
  const _$ProgressVocabularyDTOImpl(
      {required this.learning_id,
      required this.progress,
      required this.need_to_review});

  factory _$ProgressVocabularyDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgressVocabularyDTOImplFromJson(json);

  @override
  final int learning_id;
  @override
  final int progress;
  @override
  final bool need_to_review;

  @override
  String toString() {
    return 'ProgressVocabularyDTO(learning_id: $learning_id, progress: $progress, need_to_review: $need_to_review)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressVocabularyDTOImpl &&
            (identical(other.learning_id, learning_id) ||
                other.learning_id == learning_id) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.need_to_review, need_to_review) ||
                other.need_to_review == need_to_review));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, learning_id, progress, need_to_review);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressVocabularyDTOImplCopyWith<_$ProgressVocabularyDTOImpl>
      get copyWith => __$$ProgressVocabularyDTOImplCopyWithImpl<
          _$ProgressVocabularyDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgressVocabularyDTOImplToJson(
      this,
    );
  }
}

abstract class _ProgressVocabularyDTO implements ProgressVocabularyDTO {
  const factory _ProgressVocabularyDTO(
      {required final int learning_id,
      required final int progress,
      required final bool need_to_review}) = _$ProgressVocabularyDTOImpl;

  factory _ProgressVocabularyDTO.fromJson(Map<String, dynamic> json) =
      _$ProgressVocabularyDTOImpl.fromJson;

  @override
  int get learning_id;
  @override
  int get progress;
  @override
  bool get need_to_review;
  @override
  @JsonKey(ignore: true)
  _$$ProgressVocabularyDTOImplCopyWith<_$ProgressVocabularyDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
