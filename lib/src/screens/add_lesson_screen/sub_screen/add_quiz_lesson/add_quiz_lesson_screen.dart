import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/screens/add_lesson_screen/sub_screen/add_quiz_lesson/sub_screen/add_multichoice_screen.dart';
import 'package:membreadflutter/src/screens/add_lesson_screen/sub_screen/notifiers/create_course_notifier/create_lesson_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/primarybutton.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/none_title_appbar.dart';

class AddQuizLessonScreen extends ConsumerStatefulWidget {
  final int courseId;
  const AddQuizLessonScreen({super.key, required this.courseId});

  @override
  ConsumerState createState() => _AddQuizLessonScreenState();
}

class _AddQuizLessonScreenState extends ConsumerState<AddQuizLessonScreen> {
  @override
  Widget build(BuildContext context) {
    final addQuizLesson = ref.watch(createLessonNotifierProvider);
    print("TITLE : ${addQuizLesson.title}");
    print("DESCRIPTION : ${addQuizLesson.description}");
    return Scaffold(
      appBar: NonTitleAppBar(
        onPressed: () => Navigator.pop(context),
      ),
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lesson : ${addQuizLesson.title}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "${addQuizLesson.description}",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Column(
                  children: [],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation)
                          => AddMultiChoiceScreen(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(0.0, 1.0);
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
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Text(
                      "+ Add",
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                  ))),
        )
      ]),
    );
  }
}
