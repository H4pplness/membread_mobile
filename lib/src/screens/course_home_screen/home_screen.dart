import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:membreadflutter/src/screens/course_home_screen/sub_screens/home.dart';
import 'package:membreadflutter/src/screens/course_home_screen/sub_screens/rank.dart';
import 'package:membreadflutter/src/screens/course_home_screen/sub_screens/study.dart';
import '../../domain/services/course_service/course.service.dart';
import '../../widgets/organisms/app_bars/home_page_appbar.dart';
import 'bottom_nav_bar/bottom_nav_bar.dart';
import 'controller/home_controller.dart';

class HomeScreen extends ConsumerWidget {
  int courseId;
  HomeScreen({super.key, required this.courseId});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCourse = ref.watch(getCourseProvider(courseId));
    return currentCourse.when(
        data: (data) {
          controller.changeLesson(data.currentLesson);
          return Scaffold(
            appBar: HomePageAppBar(
              title: data.title??"",
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Obx(() => IndexedStack(
                  index: controller.index.value,
                  children: [
                    Home(
                      lessonInfo: data.listLesson?.firstWhere((element) =>
                          element.id == controller.currentLesson.value),
                    ),
                    Study(listLesson: data.listLesson),
                    Rank()
                  ],
                )),
            bottomNavigationBar: BottomNavBar(),
          );
        },
        error: (error, s) {
          printError(info: error.toString());
          return Text(error.toString());
        },
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
