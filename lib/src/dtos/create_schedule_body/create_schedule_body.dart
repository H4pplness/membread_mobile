import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_schedule_body.g.dart';
part 'create_schedule_body.freezed.dart';

@freezed
class CreateScheduleBody with _$CreateScheduleBody{
  const factory CreateScheduleBody({
    String? title,
    String? description,
    String? time,
    DateTime? scheduledDate,
    int? courseId,
    @Default(false) bool eachSunday,
    @Default(false) bool eachMonday,
    @Default(false) bool eachTuesday,
    @Default(false) bool eachWednesday,
    @Default(false) bool eachThursday,
    @Default(false) bool eachFriday,
    @Default(false) bool eachSaturday}) = _CreateScheduleBody;

  factory CreateScheduleBody.fromJson(Map<String,dynamic> json) => _$CreateScheduleBodyFromJson(json);
}