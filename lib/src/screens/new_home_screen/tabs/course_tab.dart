import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/get_learning_courses/get_learning_courses.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/get_popular_courses/get_popular_courses.dart';
import 'package:membreadflutter/src/screens/course_screen/course_screen.dart';
import 'package:membreadflutter/src/screens/new_home_screen/notifier/course_tab/course_tab_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/color_button.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/new_course_card.dart';
import 'package:membreadflutter/src/widgets/molecules/textfield/search_field.dart';
import '../../../domain/models/course.dart';
import '../../../domain/repositories/course_repository/get_teaching_courses/get_teaching_courses.dart';

class CourseTab extends ConsumerWidget {
  const CourseTab({super.key});

  _buildLearningCourse(List<Course> learningCourses,context) {
    List<Widget> learningComponents = [];

    learningCourses.forEach((course) {
      learningComponents.add(CourseCard(
        course: course,
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CourseScreen(
                  course: course,
                ))),
      ));
      learningComponents.add(SizedBox(height: 5,));
    });

    return learningComponents;
  }

  @override
  Widget build(BuildContext context, ref) {
    final course_tab = ref.watch(courseTabNotifierProvider);

    final popularCourse = ref.watch(getPopularCoursesProvider);

    final learningCourse = ref.watch(getLearningCourseProvider);

    final teachingCourse = ref.watch(getTeachingCourseProvider);

    AsyncValue<List<Course>> courses;

    if(course_tab == 0){
      courses = popularCourse;
    }else if(course_tab == 1){
      courses = learningCourse;
    }else{
      courses = teachingCourse;
    }

    return Container(
      padding: EdgeInsets.only(top: 10,left: 20,right: 20),
      child: Column(
        children: [
          const SearchField(),
          const SizedBox(height: 5),
          Row(
            children: [
              ColorButton(
                  color:
                      course_tab == 0 ? Theme.of(context).primaryColor : null,
                  onPressed: () {
                    ref.read(courseTabNotifierProvider.notifier).setIndex(0);
                  },
                  child: Text("Popular",
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color:
                              course_tab == 0 ? Colors.white : Colors.black))),
              ColorButton(
                  color:
                      course_tab == 1 ? Theme.of(context).primaryColor : null,
                  onPressed: () {
                    ref.read(courseTabNotifierProvider.notifier).setIndex(1);
                  },
                  child: Text("Learning",
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color:
                              course_tab == 1 ? Colors.white : Colors.black))),
              ColorButton(
                  color:
                      course_tab == 2 ? Theme.of(context).primaryColor : null,
                  onPressed: () {
                    ref.read(courseTabNotifierProvider.notifier).setIndex(2);
                  },
                  child: Text("Teaching",
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color:
                              course_tab == 2 ? Colors.white : Colors.black))),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
              child: SingleChildScrollView(
            child: courses.when(data: (learningCourse){
              return Column(
                  children: _buildLearningCourse(learningCourse, context)
              );
            }, error: (error,__){
              print(error);
              return Text("ERROR : $error");
            }, loading: ()=>CircularProgressIndicator())

          ))
        ],
      ),
    );
  }
}
