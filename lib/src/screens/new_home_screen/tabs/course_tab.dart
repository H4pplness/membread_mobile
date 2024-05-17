import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/domain/models/user.dart';
import 'package:membreadflutter/src/screens/course_screen/course_screen.dart';
import 'package:membreadflutter/src/screens/new_home_screen/notifier/course_tab/course_tab_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/color_button.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/new_course_card.dart';
import 'package:membreadflutter/src/widgets/molecules/textfield/search_field.dart';
import '../../../domain/models/course.dart';

User demoUser = User(username: "Membread");
Course demoCourse = Course(id: 1,title: "Khóa học cơ bản",description: "",author: demoUser);

class CourseTab extends ConsumerWidget {
  const CourseTab({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final course_tab = ref.watch(courseTabNotifierProvider);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          const SearchField(),
          const SizedBox(height: 5),
          Row(
            children: [
              ColorButton(
                  color: course_tab == 0 ? Theme.of(context).primaryColor : null,
                  onPressed: () {
                    ref.read(courseTabNotifierProvider.notifier).setIndex(0);
                  },
                  child: Text("Popular",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight : FontWeight.w500,
                          color: course_tab == 0
                              ? Colors.white
                              : Colors.black))),
              ColorButton(
                  color: course_tab == 1 ? Theme.of(context).primaryColor : null,
                  onPressed: () {
                    ref.read(courseTabNotifierProvider.notifier).setIndex(1);
                  },
                  child: Text("Learning",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight : FontWeight.w500,
                          color: course_tab == 1
                              ? Colors.white
                              : Colors.black))),
              ColorButton(
                  color: course_tab == 2 ? Theme.of(context).primaryColor : null,
                  onPressed: () {
                    ref.read(courseTabNotifierProvider.notifier).setIndex(2);
                  },
                  child: Text("Teaching",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight : FontWeight.w500,
                          color: course_tab == 2
                              ? Colors.white
                              : Colors.black))),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CourseCard(
                    course: demoCourse,
                    onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>CourseScreen(course: demoCourse,))),),
                  const SizedBox(height: 5),
                  CourseCard(course: demoCourse),
                  const SizedBox(height: 5),
                  CourseCard(course: demoCourse),
                  const SizedBox(height: 5),
                  CourseCard(course: demoCourse),
                  const SizedBox(height: 5),
                  CourseCard(course: demoCourse),
                  const SizedBox(height: 5),
                  CourseCard(course: demoCourse),
                  const SizedBox(height: 5),
                  CourseCard(course: demoCourse)
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
