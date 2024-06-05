import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/database/local/user/logined_user.dart';
import 'package:membreadflutter/src/domain/models/course.dart';
import 'package:membreadflutter/src/domain/models/learning.dart';
import 'package:membreadflutter/src/domain/models/vocabulary_lesson.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/get_course_info/get_course_info.dart';
import 'package:membreadflutter/src/screens/add_lesson_screen/add_leson_screen.dart';
import 'package:membreadflutter/src/screens/course_edit_screen/course_edit_screen.dart';
import 'package:membreadflutter/src/screens/leader_board_screen/leader_board_screen.dart';
import 'package:membreadflutter/src/screens/new_home_screen/new_home_screen.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/new_lesson_card.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/none_title_appbar.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/summary_course_appbar.dart';

import '../../domain/models/lesson.dart';
import '../lesson_screen/vocabulary_lesson_screen.dart';

class CourseScreen extends ConsumerWidget {
  final Course course;
  CourseScreen({super.key, required this.course});

  _buildAlert() {
    return SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
      content: Text(
        'You must subcribe to study!',
        style: GoogleFonts.montserrat(fontSize: 15, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseParams = GetCourseInfoParams(course.id ?? 0);
    final courseDetailFuture =
        ref.read(getCourseInfoProvider(courseParams).future);
    final user = ref.watch(loginedUserProvider);

    return FutureBuilder<Course>(
      future: courseDetailFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
              appBar: NonTitleAppBar(
                  onPressed: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => NewHomeScreen()),
                      (route) => false)),
              body: const Center(
                child: CircularProgressIndicator(),
              ));
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: NonTitleAppBar(onPressed: () => Navigator.pop(context)),
            body: const Center(
              child: Text("Some thing wrong :v"),
            ),
          );
        } else if (snapshot.hasData) {
          final course = snapshot.data!;
          bool isAuthor = (course.author?.id == user.getId());
          return Scaffold(
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  title: Text(course.title ?? "",
                      style: Theme.of(context).appBarTheme.titleTextStyle),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 20),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  actions: [
                    IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LeaderBoardScreen(
                                      course: course,
                                    ))),
                        icon: const Icon(Icons.leaderboard,
                            weight: 50, size: 25)),
                    isAuthor
                        ? IconButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CourseEditScreen(
                                          course: course,
                                        ))),
                            icon: const Icon(
                              Icons.settings,
                              weight: 50,
                              size: 25,
                            ))
                        : Container(),
                  ],
                  pinned: true,
                  floating: true,
                  stretchTriggerOffset: 300.0,
                  expandedHeight: 200.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: course.avatar != null
                        ? Image.network(course.avatar ?? "", fit: BoxFit.cover)
                        : Image.asset("assets/membread.jpg", fit: BoxFit.cover),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SummaryCourseAppbar(
                    course: course,
                  ),
                ),
                if (isAuthor)
                  SliverToBoxAdapter(
                      child: GestureDetector(
                    child: Container(
                      height: 70,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          color: Colors.grey[100]),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AddLessonScreen(courseId: course.id!))),
                  )),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      Lesson<Learning>? lesson = course.lessons?[index];
                      return LessonCard(
                        title: course.lessons?[index].title ?? "",
                        description: course.lessons?[index].description ?? "",
                        onTap: () {
                          if (course.canStudy!) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              switch (course.lessons![index].runtimeType) {
                                case VocabularyLesson:
                                  return VocabularyLessonScreen(
                                      lesson: lesson as VocabularyLesson);
                                default:
                                  return Scaffold(
                                    appBar: AppBar(
                                        title: Text('Unknown Lesson Type',
                                            style: Theme.of(context)
                                                .appBarTheme
                                                .titleTextStyle)),
                                    body: Center(
                                        child: Text(
                                            'This lesson type is not supported.',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium)),
                                  );
                              }
                            }));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(_buildAlert());
                          }
                        },
                      );
                    },
                    childCount: course.lessons?.length ?? 0,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text("No data available"),
          );
        }
      },
    );
  }
}
