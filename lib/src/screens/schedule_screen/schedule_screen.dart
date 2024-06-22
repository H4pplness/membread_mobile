import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/domain/models/course.dart';
import 'package:membreadflutter/src/domain/models/task.dart';
import 'package:membreadflutter/src/domain/repositories/notification_repository/get_schedules/get_schedules.dart';
import 'package:membreadflutter/src/screens/add_schedule_screen/add_schedule_screen.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/title_appbar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../domain/models/schedule.dart';
import '../../widgets/atoms/cards/task_card.dart';

extension MyDateExtension on DateTime {
  DateTime getDateOnly() {
    return DateTime(this.year, this.month, this.day);
  }
}

class ScheduleScreen extends ConsumerStatefulWidget {
  Course? course;
  ScheduleScreen({super.key, this.course});

  @override
  ConsumerState<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends ConsumerState<ScheduleScreen> {
  bool _isFirstTime = true;
  CalendarFormat _format = CalendarFormat.week;
  DateTime selectedDay = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.refresh(getScheduleProvider);
    });
  }

  _getScheduleFromDay(DateTime time, List<Schedule> schedules) {
    final weekDay = time.weekday;
    List<Task> selectedDayTask = [];

    schedules.forEach((schedule) {
      if (widget.course != null) {
        if (widget.course!.id == schedule.courseId) {
          print("CODE DA VAO DAY !");
          if (schedule.scheduledDate != null) {
            if (schedule.scheduledDate!.getDateOnly() == time.getDateOnly()) {
              selectedDayTask.add(Task(
                  id: schedule.id,
                  title: schedule.title,
                  body: schedule.body,
                  time: schedule.time));
            }
          } else {
            switch (weekDay) {
              case 1:
                if (schedule.eachMonday ?? false) {
                  selectedDayTask.add(Task(
                      id: schedule.id,
                      title: schedule.title,
                      body: schedule.body,
                      time: schedule.time));
                }
              case 2:
                if (schedule.eachTuesday ?? false) {
                  selectedDayTask.add(Task(
                      id: schedule.id,
                      title: schedule.title,
                      body: schedule.body,
                      time: schedule.time));
                }
              case 3:
                if (schedule.eachWednesday ?? false) {
                  selectedDayTask.add(Task(
                      id: schedule.id,
                      title: schedule.title,
                      body: schedule.body,
                      time: schedule.time));
                }
              case 4:
                if (schedule.eachThursday ?? false) {
                  selectedDayTask.add(Task(
                      id: schedule.id,
                      title: schedule.title,
                      body: schedule.body,
                      time: schedule.time));
                }
              case 5:
                if (schedule.eachFriday ?? false) {
                  selectedDayTask.add(Task(
                      id: schedule.id,
                      title: schedule.title,
                      body: schedule.body,
                      time: schedule.time));
                }
              case 6:
                if (schedule.eachSaturday ?? false) {
                  selectedDayTask.add(Task(
                      id: schedule.id,
                      title: schedule.title,
                      body: schedule.body,
                      time: schedule.time));
                }
              case 7:
                if (schedule.eachSunday ?? false) {
                  selectedDayTask.add(Task(
                      id: schedule.id,
                      title: schedule.title,
                      body: schedule.body,
                      time: schedule.time));
                }
            }
          }
        }
      }
      else {
        if (schedule.scheduledDate != null) {
          if (schedule.scheduledDate!.getDateOnly() == time.getDateOnly()) {
            selectedDayTask.add(Task(
                id: schedule.id,
                title: schedule.title,
                body: schedule.body,
                time: schedule.time));
          }
        } else {
          switch (weekDay) {
            case 1:
              if (schedule.eachMonday ?? false) {
                selectedDayTask.add(Task(
                    id: schedule.id,
                    title: schedule.title,
                    body: schedule.body,
                    time: schedule.time));
              }
            case 2:
              if (schedule.eachTuesday ?? false) {
                selectedDayTask.add(Task(
                    id: schedule.id,
                    title: schedule.title,
                    body: schedule.body,
                    time: schedule.time));
              }
            case 3:
              if (schedule.eachWednesday ?? false) {
                selectedDayTask.add(Task(
                    id: schedule.id,
                    title: schedule.title,
                    body: schedule.body,
                    time: schedule.time));
              }
            case 4:
              if (schedule.eachThursday ?? false) {
                selectedDayTask.add(Task(
                    id: schedule.id,
                    title: schedule.title,
                    body: schedule.body,
                    time: schedule.time));
              }
            case 5:
              if (schedule.eachFriday ?? false) {
                selectedDayTask.add(Task(
                    id: schedule.id,
                    title: schedule.title,
                    body: schedule.body,
                    time: schedule.time));
              }
            case 6:
              if (schedule.eachSaturday ?? false) {
                selectedDayTask.add(Task(
                    id: schedule.id,
                    title: schedule.title,
                    body: schedule.body,
                    time: schedule.time));
              }
            case 7:
              if (schedule.eachSunday ?? false) {
                selectedDayTask.add(Task(
                    id: schedule.id,
                    title: schedule.title,
                    body: schedule.body,
                    time: schedule.time));
              }
          }
        }
      }
    });

    return selectedDayTask;
  }

  _buildListTask(List<Task> tasks) {
    List<Widget> taskComponents = [];
    taskComponents.add(GestureDetector(
      child: Container(
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200]),
        child: Center(
          child: Icon(
            Icons.add,
            size: 50,
            color: Colors.grey[400]!,
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddScheduleScreen(course: widget.course,day : selectedDay)));
      },
    ));
    taskComponents.add(const SizedBox(
      height: 5,
    ));
    for (var task in tasks) {
      taskComponents.add(TaskCard(task: task));
      taskComponents.add(const SizedBox(height: 5));
    }

    return taskComponents;
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final schedules = ref.watch(getScheduleProvider);
    return Scaffold(
      appBar: TitleAppbar(
        title: Text(
          "Schedule",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        leadingButtonOnPressed: () => Navigator.pop(context),
      ),
      body: schedules.when(
          data: (schedules) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TableCalendar(
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        weekendStyle: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      currentDay: DateTime.now(),
                      pageJumpingEnabled: true,
                      focusedDay: focusedDay,
                      rowHeight: 65,
                      firstDay: today.subtract(Duration(days: 100)),
                      lastDay: today.add(Duration(days: 200)),
                      calendarFormat: _format,
                      onFormatChanged: (CalendarFormat format) {
                        setState(() {
                          _format = format;
                        });
                      },
                      eventLoader: (time) =>
                          _getScheduleFromDay(time, schedules),
                      onDaySelected: (DateTime selectDay, DateTime focusDay) {
                        setState(() {
                          selectedDay = selectDay;
                          focusedDay = focusDay;
                        });
                      },
                      selectedDayPredicate: (DateTime date) {
                        return isSameDay(selectedDay, date);
                      },
                      availableCalendarFormats: const {
                        CalendarFormat.week: 'Week',
                        CalendarFormat.month: 'Month'
                      },
                      headerStyle: HeaderStyle(
                        headerMargin: EdgeInsets.only(right: 20),
                        titleTextStyle: GoogleFonts.montserrat(
                            fontSize: 18, fontWeight: FontWeight.w500),
                        titleCentered: true,
                        formatButtonVisible: true,
                        formatButtonShowsNext: false,
                        leftChevronVisible: false,
                        rightChevronVisible: false,
                        formatButtonDecoration: BoxDecoration(
                          color: Color.lerp(
                              const Color.fromARGB(255, 59, 117, 245),
                              const Color.fromARGB(255, 76, 142, 246),
                              1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        formatButtonTextStyle:
                            Theme.of(context).textTheme.labelSmall!,
                      ),
                      calendarStyle: CalendarStyle(
                          defaultTextStyle:
                              Theme.of(context).textTheme.displaySmall!,
                          markersMaxCount: 1,
                          markerDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.teal[500]),
                          selectedTextStyle: GoogleFonts.montserrat(
                              fontSize: 14, color: Colors.white),
                          todayTextStyle: GoogleFonts.montserrat(
                              fontSize: 14, color: Colors.white),
                          todayDecoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.lerp(
                                  const Color.fromARGB(255, 59, 117, 245),
                                  const Color.fromARGB(255, 76, 142, 246),
                                  1)),
                          selectedDecoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue[200]!)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                        children: _buildListTask(
                            _getScheduleFromDay(selectedDay, schedules))),
                  ))
                ],
              ),
            );
          },
          error: (error, _) {
            print(error);
            return Container();
          },
          loading: () => Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
