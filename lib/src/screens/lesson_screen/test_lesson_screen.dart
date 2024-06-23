import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/models/test_lesson.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/get_lesson/get_lesson.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/test/speed_review/test_speed_review.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/study_type_card.dart';

import '../../domain/models/lesson.dart';
import '../../domain/models/test.dart';
import '../../widgets/organisms/app_bars/title_appbar.dart';

class TestLessonScreen extends ConsumerWidget {
  TestLesson lesson;
  int courseId;
  TestLessonScreen({super.key, required this.lesson, required this.courseId});

  _buildLearningComponent(List<Test> listTest) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testLesson = ref.watch(getLessonProvider(lesson.id!));
    return Scaffold(
      appBar: TitleAppbar(
        leadingButtonOnPressed: () => Navigator.pop(context),
        title: Text(lesson.title ?? "",
            style: Theme.of(context).appBarTheme.titleTextStyle),
      ),
      body: testLesson.when(
          data: (testLesson) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    StudyTypeCard(
                        icon: Icons.access_time,
                        title: "Speed review",
                        summary: "...",
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TestSpeedReview(
                                    lesson: testLesson as TestLesson,
                                    courseId: courseId)))),
                    SizedBox(
                      height: 5,
                    ),
                    StudyTypeCard(
                        icon: Icons.list,
                        title: "List question",
                        summary: "...")
                  ],
                ),
              ),
            );
          },
          error: (error, _) {
            print("ERROR : $error");
            return Container();
          },
          loading: () => Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
