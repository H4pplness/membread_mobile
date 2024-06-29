import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network.dart';
import '../../../models/schedule.dart';

class ScheduleNotifier extends StateNotifier<List<Schedule>?>{
  final Ref ref;
  ScheduleNotifier(this.ref):super(null){
    fetchSchedule();
  }

  Future<void> fetchSchedule() async {
    final dio = await ref.read(dioProviderWithAccessToken.future);
    Response response = await dio.get('notification/schedule');
    if (response.statusCode == 200) {
      final result = response.data as List;

      state = result.map((schedule) {
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
    } else {
      throw Exception();
    }
  }

  void addSchedule(Schedule schedule){
    if(state!=null) {
      state = [...state!,schedule];
    } else{
      state = [schedule];
    }
  }
}

final getScheduleProvider = StateNotifierProvider<ScheduleNotifier, List<Schedule>?>((ref) => ScheduleNotifier(ref));
