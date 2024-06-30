import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/screens/schedule_screen/schedule_screen.dart';
import '../../../../core/network.dart';
import '../../../models/schedule.dart';

class ScheduleNotifier extends StateNotifier<List<Schedule>?> {
  final Ref ref;
  ScheduleNotifier(this.ref) : super(null) {
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
            scheduledDate: schedule['scheduledDate'] != null
                ? DateTime.parse(schedule['scheduledDate'])
                : null,
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

  void addSchedule(Schedule schedule) {
    if (state != null) {
      state = [...state!, schedule];
    } else {
      state = [schedule];
    }
  }

  List<Schedule> getTodaySchedule() {
    final now = DateTime.now();
    final weekDay = now.weekday;
    if (state == null) return [];

    List<Schedule> selectedDayTask = [];
    state!.forEach((schedule) {
      if (schedule.scheduledDate != null) {
        if (schedule.scheduledDate!.getDateOnly() == now.getDateOnly()) {
          selectedDayTask.add(schedule);
        }
      } else {
        switch (weekDay) {
          case 1:
            if (schedule.eachMonday ?? false) {
              selectedDayTask.add(schedule);
            }
          case 2:
            if (schedule.eachTuesday ?? false) {
              selectedDayTask.add(schedule);
            }
          case 3:
            if (schedule.eachWednesday ?? false) {
              selectedDayTask.add(schedule);
            }
          case 4:
            if (schedule.eachThursday ?? false) {
              selectedDayTask.add(schedule);
            }
          case 5:
            if (schedule.eachFriday ?? false) {
              selectedDayTask.add(schedule);
            }
          case 6:
            if (schedule.eachSaturday ?? false) {
              selectedDayTask.add(schedule);
            }
          case 7:
            if (schedule.eachSunday ?? false) {
              selectedDayTask.add(schedule);
            }
        }
      }
    });

    return selectedDayTask;
  }
}

final getScheduleProvider =
    StateNotifierProvider<ScheduleNotifier, List<Schedule>?>(
        (ref) => ScheduleNotifier(ref));
