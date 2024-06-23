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
    );

Map<String, dynamic> _$$VocbularyDTOImplToJson(_$VocbularyDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vocabulary': instance.vocabulary,
      'mean': instance.mean,
      'progress': instance.progress,
    };
