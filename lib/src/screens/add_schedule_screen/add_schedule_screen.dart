import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:membreadflutter/src/domain/models/course.dart';
import 'package:membreadflutter/src/domain/models/schedule.dart';
import 'package:membreadflutter/src/domain/repositories/notification_repository/create_schedule/create_schedule.dart';
import 'package:membreadflutter/src/domain/repositories/notification_repository/get_schedules/get_schedules.dart';
import 'package:membreadflutter/src/dtos/day_enum/day_enum.dart';
import 'package:membreadflutter/src/screens/add_schedule_screen/notifiers/repeat_notifier/repeat_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/save_button.dart';
import 'package:membreadflutter/src/widgets/atoms/text_fields/custom_textfield.dart';
import 'package:membreadflutter/src/widgets/atoms/text_fields/schedule_date_textfield.dart';
import 'package:membreadflutter/src/widgets/atoms/text_fields/time_input_textfield.dart';
import 'package:membreadflutter/src/widgets/molecules/icon_group/repeat_schedule_group.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/none_title_appbar.dart';
import '../../dtos/create_schedule_body/create_schedule_body.dart';

class AddScheduleScreen extends ConsumerStatefulWidget {
  Course? course;
  DateTime? day;
  AddScheduleScreen({super.key, this.course,this.day});

  @override
  ConsumerState<AddScheduleScreen> createState() => _AddScheduleScreenState();
}

class _AddScheduleScreenState extends ConsumerState<AddScheduleScreen> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  String _time = DateFormat("hh:mm").format(DateTime(2024)).toString();
  Course? _course;
  late DateTime _day;
  int _selectedOption = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.course != null) _course = widget.course!;
    _day = widget.day!;
  }

  @override
  Widget build(BuildContext context) {
    final repeatNotifier = ref.watch(repeatNotifierProvider);

    return Scaffold(
      appBar: NonTitleAppBar(
        onPressed: () => Navigator.pop(context),
        actions: [
          SaveButton(
            onTap: () async {
              await Future.delayed(const Duration(microseconds: 200), () async {
                await ref.read(createScheduleProvider(CreateScheduleBody(
                    title: "${_course!=null?_course!.title!+": " : ""}${_titleController.text}",
                    description: _bodyController.text,
                    time: _time,
                    courseId: _course!=null? _course!.id : null,
                    scheduledDate:_selectedOption==0? DateFormat('yyyy-MM-dd').format(_day) : null,
                    eachMonday:_selectedOption==1? repeatNotifier.contains(Day.MON) : false,
                    eachSunday:_selectedOption==1?  repeatNotifier.contains(Day.SUN) : false,
                    eachTuesday:_selectedOption==1?  repeatNotifier.contains(Day.TUE) : false,
                    eachThursday:_selectedOption==1?  repeatNotifier.contains(Day.THU) : false,
                    eachWednesday:_selectedOption==1?  repeatNotifier.contains(Day.WED) : false,
                    eachSaturday:_selectedOption==1?  repeatNotifier.contains(Day.SAT) : false,
                    eachFriday:_selectedOption==1?  repeatNotifier.contains(Day.FRI) : false),

                )
                    .future);
                ref.watch(getScheduleProvider.notifier).addSchedule(Schedule(
                    title: "${_course!=null?_course!.title!+": " : ""}${_titleController.text}",
                    body: _bodyController.text,
                    time: _time,
                    courseId: _course!=null? _course!.id : null,
                    scheduledDate:_selectedOption==0?_day:null,
                    eachMonday:_selectedOption==1? repeatNotifier.contains(Day.MON) : false,
                    eachSunday:_selectedOption==1?  repeatNotifier.contains(Day.SUN) : false,
                    eachTuesday:_selectedOption==1?  repeatNotifier.contains(Day.TUE) : false,
                    eachThursday:_selectedOption==1?  repeatNotifier.contains(Day.THU) : false,
                    eachWednesday:_selectedOption==1?  repeatNotifier.contains(Day.WED) : false,
                    eachSaturday:_selectedOption==1?  repeatNotifier.contains(Day.SAT) : false,
                    eachFriday:_selectedOption==1?  repeatNotifier.contains(Day.FRI) : false
                ));
              });

              Navigator.pop(context);
            },),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_course != null)
              Text(
                "Course : ${_course!.title}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: _titleController,
              name: "Title",
              labelStyle: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700]),
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 0.5, color: Colors.grey))),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: _bodyController,
              name: "Content",
              labelStyle: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700]),
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 0.5, color: Colors.grey))),
            ),
            const SizedBox(
              height: 15,
            ),
            TimeInputTextfield(
              name: "Time",
              labelStyle: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700]),
              decoration: InputDecoration(
                  hintText: _time,
                  hintStyle: Theme.of(context).textTheme.displayMedium,
                  suffixIcon: IconButton(
                    onPressed: () {
                      _getTimeFromUser(isStartTime: true);
                    },
                    icon: const Icon(Icons.access_time),
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 0.5, color: Colors.grey[300]!)))
            ),
            Row(
              children: [
                Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: _selectedOption,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                    ),
                    const SizedBox(width: 5,),
                    Text('Date',style: Theme.of(context).textTheme.displayMedium,),
                  ],
                ),
                const SizedBox(width: 20,),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: _selectedOption,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                    ),
                    const SizedBox(width: 5,),
                    Text('Repeat',style: Theme.of(context).textTheme.displayMedium,),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15,),
            if(_selectedOption == 0)
            ScheduleDateTextField(day: _day),
            if(_selectedOption == 1)
              RepeatScheduleGroup(
              weekDay: repeatNotifier,
              onTap: (day) {
                ref.read(repeatNotifierProvider.notifier).addDay(day);
              }
            )
            ,
          ],
        ),
      ),
    );
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    if (pickedTime != null) {
      String formatedTime = pickedTime.format(context);
      if (pickedTime == null) {
      } else if (isStartTime == true) {
        setState(() {
          _time = formatedTime;
        });
      } else {
        setState(() {
          _time = formatedTime;
        });
      }
    }
    print("$_time");
  }

  _showTimePicker() async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      cancelText: "Cancel",
      confirmText: "Ok",
      initialEntryMode: TimePickerEntryMode.inputOnly,
      initialTime: TimeOfDay(
        hour: int.parse(_time.split(":")[0]),
        minute: int.parse(_time.split(":")[1].split(" ")[0]),
      ),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            // Customize the dialog's background color
            dialogBackgroundColor: Colors.white,

            // Customize the time picker text button's color
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  textStyle: Theme.of(context).textTheme.labelSmall),
            ),

            // Customize the shape of the dialog
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),

            // Customize the time picker
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Colors.white,
              hourMinuteTextColor: Theme.of(context).primaryColor,
              dialHandColor: Theme.of(context).primaryColor,
              dialBackgroundColor: Colors.grey,
              entryModeIconColor: Theme.of(context).primaryColor,
              cancelButtonStyle:
                  TextButton.styleFrom(backgroundColor: Colors.white),
              confirmButtonStyle:
                  TextButton.styleFrom(backgroundColor: Colors.white),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedTime != null) {
      setState(() {
        _time = "${selectedTime.hour}:${selectedTime.minute}";
      });
    }
  }
}
