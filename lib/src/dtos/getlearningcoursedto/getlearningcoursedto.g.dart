// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getlearningcoursedto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetLearningCourseDTOImpl _$$GetLearningCourseDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$GetLearningCourseDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$GetLearningCourseDTOImplToJson(
        _$GetLearningCourseDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'rating': instance.rating,
    };
