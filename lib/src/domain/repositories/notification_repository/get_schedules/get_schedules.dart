import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/schedule.dart';

part 'get_schedules.g.dart';

@riverpod
Future<List<Schedule>> getSchedule(ref) async {
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response = await dio.get('notification/schedule');
  if (response.statusCode == 200) {
    final result = response.data as List;

    final schedules = await result.map((schedule) {
      return Schedule(
          id: schedule['id'],
          time: schedule['time'],
          title: schedule['title'],
          body: schedule['body'],
          courseId: schedule['courseId'],
          scheduledDate: schedule['scheduledDate']!=null ?  DateTime.parse(schedule['scheduledDate']) : null,
          eachFriday: schedule['eachFriday'],
          eachMonday: schedule['eachMonday'],
          eachSaturday: schedule['eachSaturday'],
          eachSunday: schedule['eachSunday'],
          eachThursday: schedule['eachThursday'],
          eachTuesday: schedule['eachTuesday'],
          eachWednesday: schedule['eachWednesday']);
    }).toList();
    return schedules;
  } else {
    throw Exception();
  }
}
