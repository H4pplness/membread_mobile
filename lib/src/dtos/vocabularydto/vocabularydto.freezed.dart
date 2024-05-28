// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vocabularydto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VocabularyDTO _$VocabularyDTOFromJson(Map<String, dynamic> json) {
  return _VocbularyDTO.fromJson(json);
}

/// @nodoc
mixin _$VocabularyDTO {
  int? get id => throw _privateConstructorUsedError;
  String? get vocabulary => throw _privateConstructorUsedError;
  String? get mean => throw _privateConstructorUsedError;
  int? get progress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VocabularyDTOCopyWith<VocabularyDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyDTOCopyWith<$Res> {
  factory $VocabularyDTOCopyWith(
          VocabularyDTO value, $Res Function(VocabularyDTO) then) =
      _$VocabularyDTOCopyWithImpl<$Res, VocabularyDTO>;
  @useResult
  $Res call({int? id, String? vocabulary, String? mean, int? progress});
}

/// @nodoc
class _$VocabularyDTOCopyWithImpl<$Res, $Val extends VocabularyDTO>
    implements $VocabularyDTOCopyWith<$Res> {
  _$VocabularyDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? vocabulary = freezed,
    Object? mean = freezed,
    Object? progress = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      vocabulary: freezed == vocabulary
          ? _value.vocabulary
          : vocabulary // ignore: cast_nullable_to_non_nullable
              as String?,
      mean: freezed == mean
          ? _value.mean
          : mean // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VocbularyDTOImplCopyWith<$Res>
    implements $VocabularyDTOCopyWith<$Res> {
  factory _$$VocbularyDTOImplCopyWith(
          _$VocbularyDTOImpl value, $Res Function(_$VocbularyDTOImpl) then) =
      __$$VocbularyDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? vocabulary, String? mean, int? progress});
}

/// @nodoc
class __$$VocbularyDTOImplCopyWithImpl<$Res>
    extends _$VocabularyDTOCopyWithImpl<$Res, _$VocbularyDTOImpl>
    implements _$$VocbularyDTOImplCopyWith<$Res> {
  __$$VocbularyDTOImplCopyWithImpl(
      _$VocbularyDTOImpl _value, $Res Function(_$VocbularyDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? vocabulary = freezed,
    Object? mean = freezed,
    Object? progress = freezed,
  }) {
    return _then(_$VocbularyDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      vocabulary: freezed == vocabulary
          ? _value.vocabulary
          : vocabulary // ignore: cast_nullable_to_non_nullable
              as String?,
      mean: freezed == mean
          ? _value.mean
          : mean // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VocbularyDTOImpl implements _VocbularyDTO {
  const _$VocbularyDTOImpl(
      {this.id, this.vocabulary, this.mean, this.progress});

  factory _$VocbularyDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocbularyDTOImplFromJson(json);

  @override
  final int? id;
  @override
  final String? vocabulary;
  @override
  final String? mean;
  @override
  final int? progress;

  @override
  String toString() {
    return 'VocabularyDTO(id: $id, vocabulary: $vocabulary, mean: $mean, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocbularyDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vocabulary, vocabulary) ||
                other.vocabulary == vocabulary) &&
            (identical(other.mean, mean) || other.mean == mean) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, vocabulary, mean, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VocbularyDTOImplCopyWith<_$VocbularyDTOImpl> get copyWith =>
      __$$VocbularyDTOImplCopyWithImpl<_$VocbularyDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VocbularyDTOImplToJson(
      this,
    );
  }
}

abstract class _VocbularyDTO implements VocabularyDTO {
  const factory _VocbularyDTO(
      {final int? id,
      final String? vocabulary,
      final String? mean,
      final int? progress}) = _$VocbularyDTOImpl;

  factory _VocbularyDTO.fromJson(Map<String, dynamic> json) =
      _$VocbularyDTOImpl.fromJson;

  @override
  int? get id;
  @override
  String? get vocabulary;
  @override
  String? get mean;
  @override
  int? get progress;
  @override
  @JsonKey(ignore: true)
  _$$VocbularyDTOImplCopyWith<_$VocbularyDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
