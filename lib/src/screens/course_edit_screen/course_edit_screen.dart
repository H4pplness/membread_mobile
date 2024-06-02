import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/models/course.dart';
import 'package:membreadflutter/src/screens/add_lesson_screen/add_leson_screen.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/none_title_appbar.dart';

class CourseEditScreen extends ConsumerWidget {
  Course course;
  CourseEditScreen({super.key,required this.course});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: NonTitleAppBar(
        onPressed: ()=>Navigator.pop(context),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddLessonScreen(courseId: course.id!))),
              icon: const Icon(
                Icons.add,
                weight: 50,
                size: 25,
              ))
        ],
      ),
    );
  }
}
