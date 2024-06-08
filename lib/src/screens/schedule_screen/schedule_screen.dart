import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/none_title_appbar.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleScreen extends ConsumerStatefulWidget {
  const ScheduleScreen({super.key});

  @override
  ConsumerState<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends ConsumerState<ScheduleScreen> {
  CalendarFormat _format = CalendarFormat.week;
  DateTime selectedDay = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime focusedDay = DateTime.now();

  _getTasksFromDay(DateTime time) {}
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NonTitleAppBar(
        onPressed: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          TableCalendar(
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: GoogleFonts.montserrat(
                fontSize : 14,
                fontWeight : FontWeight.w500,
              ),
              weekendStyle: GoogleFonts.montserrat(
                fontSize : 14,
                fontWeight : FontWeight.w500,
              ),
            ),
            currentDay: DateTime.now(),
            pageJumpingEnabled: true,
            focusedDay: focusedDay,
            rowHeight: 60,
            firstDay: DateTime.utc(2020),
            lastDay: DateTime.utc(2025),
            calendarFormat: _format,
            onFormatChanged: (CalendarFormat format) {
              setState(() {
                _format = format;
              });
            },
            eventLoader: (time) {
              return [];
            },
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
              titleTextStyle: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.w500),
              titleCentered: true,
              formatButtonVisible: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Color.lerp(const Color.fromARGB(255, 59, 117, 245),
                    const Color.fromARGB(255, 76, 142, 246), 1),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              formatButtonTextStyle: Theme.of(context).textTheme.labelSmall!,
            ),
            calendarStyle: CalendarStyle(
                defaultTextStyle: Theme.of(context).textTheme.displaySmall!,
                markersMaxCount: 1,
                todayDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.lerp(const Color.fromARGB(255, 59, 117, 245),
                        const Color.fromARGB(255, 76, 142, 246), 1)),
                selectedDecoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blueAccent)),
          ),
        ],
      ),
    );
  }
}
