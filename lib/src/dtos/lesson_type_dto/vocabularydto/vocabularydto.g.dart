// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabularydto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VocbularyDTOImpl _$$VocbularyDTOImplFromJson(Map<String, dynamic> json) =>
    _$VocbularyDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      vocabulary: json['vocabulary'] as String?,
      mean: json['mean'] as String?,
      progress: (json['progress'] as num?)?.toInt(),
      need_to_review: json['need_to_review'] as bool?,
      last_updated: json['last_updated'] as String?,
    );

Map<String, dynamic> _$$VocbularyDTOImplToJson(_$VocbularyDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vocabulary': instance.vocabulary,
      'mean': instance.mean,
      'progress': instance.progress,
      'need_to_review': instance.need_to_review,
      'last_updated': instance.last_updated,
    };
