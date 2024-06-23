// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_schedule_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateScheduleBodyImpl _$$CreateScheduleBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateScheduleBodyImpl(
      title: json['title'] as String?,
      description: json['description'] as String?,
      time: json['time'] as String?,
      scheduledDate: json['scheduledDate'] as String?,
      courseId: (json['courseId'] as num?)?.toInt(),
      eachSunday: json['eachSunday'] as bool? ?? false,
      eachMonday: json['eachMonday'] as bool? ?? false,
      eachTuesday: json['eachTuesday'] as bool? ?? false,
      eachWednesday: json['eachWednesday'] as bool? ?? false,
      eachThursday: json['eachThursday'] as bool? ?? false,
      eachFriday: json['eachFriday'] as bool? ?? false,
      eachSaturday: json['eachSaturday'] as bool? ?? false,
    );

Map<String, dynamic> _$$CreateScheduleBodyImplToJson(
        _$CreateScheduleBodyImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'time': instance.time,
      'scheduledDate': instance.scheduledDate,
      'courseId': instance.courseId,
      'eachSunday': instance.eachSunday,
      'eachMonday': instance.eachMonday,
      'eachTuesday': instance.eachTuesday,
      'eachWednesday': instance.eachWednesday,
      'eachThursday': instance.eachThursday,
      'eachFriday': instance.eachFriday,
      'eachSaturday': instance.eachSaturday,
    };
