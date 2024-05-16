import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:membreadflutter/src/dtos/lessoninfodto/lessoninfodto.dart';
import 'package:membreadflutter/src/screens/study_screens/study/study_screen.dart';
import 'package:membreadflutter/src/screens/study_screens/test/test_page.dart';
import '../../../widgets/atoms/cards/current_lesson_card.dart';
import '../../../widgets/atoms/cards/daily_goal_card.dart';
import '../../../widgets/atoms/cards/study_type_card.dart';
import '../controller/home_controller.dart';

class Home extends ConsumerWidget {
  LessonInfoDTO? lessonInfo;
  Home({super.key,this.lessonInfo});

  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context,ref) {
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              CurrentLessonCard(
              title: lessonInfo?.title??'', onPressed: () { controller.changeIndex(1); },
            ),
            const SizedBox(
              height: 20,
            ),
            StudyTypeCard(
              title: "Flash card",
              summary: "Quick review with flash cards",
              icon: Icons.rectangle_rounded,
            ),
            const SizedBox(
              height: 10,
            ),
            StudyTypeCard(
              icon: Icons.school,
              title: "Study",
              summary: "Focus on the lessons",
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyScreen())),
            ),
            const SizedBox(
              height: 10,
            ),
            StudyTypeCard(
              icon: Icons.task_rounded,
              title: "Test",
              summary: "Review what you've learned",
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>TestPage())),
            ),
            const SizedBox(
              height: 20,
            ),
            DailyGoalCard()
          ],
        ),
      ),
    );
  }
}
