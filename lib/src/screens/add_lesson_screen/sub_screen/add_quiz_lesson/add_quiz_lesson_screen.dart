import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/dtos/lesson_type_dto/learning_dto.dart';
import 'package:membreadflutter/src/screens/add_lesson_screen/sub_screen/add_quiz_lesson/sub_screen/add_multichoice_screen.dart';
import 'package:membreadflutter/src/screens/add_lesson_screen/sub_screen/notifiers/create_course_notifier/create_lesson_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/primarybutton.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/save_button.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/none_title_appbar.dart';

import '../../../../domain/repositories/course_repository/create_lesson/create_test_lesson/create_test_lesson.dart';
import '../../../../dtos/create_lesson_dto/create_lesson_dto.dart';
import '../../../../dtos/lesson_type_dto/test_dto/create_test_dto.dart';

class AddQuizLessonScreen extends ConsumerStatefulWidget {
  final int courseId;
  const AddQuizLessonScreen({super.key, required this.courseId});

  @override
  ConsumerState createState() => _AddQuizLessonScreenState();
}

class _AddQuizLessonScreenState extends ConsumerState<AddQuizLessonScreen> {
  _buildListQuestion(List<LearningDTO> listTest) {
    List<Widget> listTestComponent = [];

    for (var test in listTest) {
      if (test is CreateTestDTO) {
        listTestComponent.add(Container(
          width: MediaQuery.of(context).size.width - 40,
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                test.question ?? "",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    test.choice1!.content ?? "",
                    style: GoogleFonts.montserrat(fontSize: 16),
                  )),
                  test.choice1!.isCorrect
                      ? Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : Icon(Icons.close, color: Colors.red),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    test.choice2!.content ?? "",
                    style: GoogleFonts.montserrat(fontSize: 16),
                  )),
                  test.choice2!.isCorrect
                      ? Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : Icon(Icons.close, color: Colors.red),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    test.choice3!.content ?? "",
                    style: GoogleFonts.montserrat(fontSize: 16),
                  )),
                  test.choice3!.isCorrect
                      ? Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : Icon(Icons.close, color: Colors.red),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    test.choice4!.content ?? "",
                    style: GoogleFonts.montserrat(fontSize: 16),
                  )),
                  test.choice4!.isCorrect
                      ? Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : Icon(Icons.close, color: Colors.red),
                ],
              )
            ],
          ),
        ));
      }
    }

    return listTestComponent;
  }

  @override
  Widget build(BuildContext context) {
    final addQuizLesson = ref.watch(createLessonNotifierProvider);
    print("TITLE : ${addQuizLesson.title}");
    print("DESCRIPTION : ${addQuizLesson.description}");
    return Scaffold(
      appBar: NonTitleAppBar(
        onPressed: () => Navigator.pop(context),
        actions: [
          SaveButton(onTap: () async {
            final newLesson = ref.watch(createLessonNotifierProvider);

            CreateLessonDTO lesson = CreateLessonDTO(
                title: newLesson.title ?? "",
                courseId: widget.courseId,
                description: newLesson.description,
                listLearning: newLesson.listLearning);

            await ref.read(createTestLessonProvider(lesson).future);

            Navigator.pop(context);
            Navigator.pop(context);
          }),
          SizedBox(width: 10,),
        ],
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
                SizedBox(
                  height: 15,
                ),
                Column(
                  children:
                      _buildListQuestion(addQuizLesson.listLearning ?? []),
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
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            AddMultiChoiceScreen(),
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
