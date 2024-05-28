import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/screens/add_lesson_screen/sub_screen/add_vocabulary_screen/add_vocabulary_screen.dart';
import 'package:membreadflutter/src/screens/add_lesson_screen/sub_screen/notifiers/create_course_notifier/create_lesson_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/text_fields/custom_textfield.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/close_title_appbar.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/none_title_appbar.dart';

class AddLessonScreen extends ConsumerWidget {
  int courseId;
  AddLessonScreen({super.key,required this.courseId});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lesson = ref.watch(createLessonNotifierProvider);

    if(lesson.title != ""){
      titleController.text = lesson.title??"";
      descriptionController.text = lesson.description??"";
    }

    return Scaffold(
      appBar: CloseTitleAppbar(
        onLeadingButtonPressed: () => Navigator.pop(context),
        actions: [
          TextButton(
              onPressed: () {
                ref
                    .read(createLessonNotifierProvider.notifier)
                    .setTitleAndDescription(
                        titleController.text, descriptionController.text,courseId);
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        AddVocabularyScreen(courseId: courseId,),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Text(
                "Next",
                style: Theme.of(context).textTheme.displayMedium,
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                controller: titleController,
                name: "Title",
                decoration: InputDecoration(
                  focusColor: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: descriptionController,
                name: "Description",
                decoration: InputDecoration(
                  focusColor: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
