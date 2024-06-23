import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/models/lesson.dart';
import 'package:membreadflutter/src/screens/add_lesson_screen/sub_screen/add_quiz_lesson/add_quiz_lesson_screen.dart';
import 'package:membreadflutter/src/screens/add_lesson_screen/sub_screen/add_vocabulary_screen/add_vocabulary_screen.dart';
import 'package:membreadflutter/src/screens/add_lesson_screen/sub_screen/notifiers/create_course_notifier/create_lesson_notifier.dart';
import 'package:membreadflutter/src/screens/add_lesson_screen/sub_screen/notifiers/lesson_type_notifier/lesson_type_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/text_fields/custom_textfield.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/close_title_appbar.dart';

class AddLessonScreen extends ConsumerWidget {
  int courseId;
  AddLessonScreen({super.key, required this.courseId});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessonType = ref.watch(lessonTypeNotifierProvider);
    final lesson = ref.watch(createLessonNotifierProvider);

    if (lesson.title != "") {
      titleController.text = lesson.title ?? "";
      descriptionController.text = lesson.description ?? "";
    }

    return Scaffold(
      appBar: CloseTitleAppbar(
        onLeadingButtonPressed: () => Navigator.pop(context),
        actions: [
          TextButton(
              onPressed: () {
                ref
                    .watch(createLessonNotifierProvider.notifier)
                    .setTitleAndDescription(titleController.text,
                        descriptionController.text, courseId);
                print(lesson.title);
                print(lesson.description);
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation){
                      switch(lessonType){
                        case LessonType.VOCABULARY :
                          return AddVocabularyScreen(courseId: courseId);
                        case LessonType.TEST :
                          return AddQuizLessonScreen(courseId : courseId);
                      }
                    },
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
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Text(
                "Type",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: DropdownButton(
                    underline: Container(
                      height: 1,
                      color: Colors.black,
                    ),
                    isExpanded: true,
                    value: lessonType,
                    items: LessonType.values
                        .map<DropdownMenuItem<LessonType>>((value) {
                      return DropdownMenuItem<LessonType>(
                        value: value,
                        child: SizedBox(
                          height: 40,
                          child: Text(
                            value.value,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      ref
                          .read(lessonTypeNotifierProvider.notifier)
                          .setType(value ?? LessonType.VOCABULARY);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
