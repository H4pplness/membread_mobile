import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/models/test_lesson.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/get_lesson/get_lesson.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/test/speed_review/test_speed_review.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/primarybutton.dart';
import '../../domain/models/test.dart';
import '../../widgets/organisms/app_bars/title_appbar.dart';

class TestLessonScreen extends ConsumerStatefulWidget {
  TestLesson lesson;
  int courseId;
  TestLessonScreen({super.key, required this.lesson, required this.courseId});

  @override
  ConsumerState<TestLessonScreen> createState() => _TestLessonScreenState();
}

class _TestLessonScreenState extends ConsumerState<TestLessonScreen> {
  late List<Test>? listQuestion;

  @override
  void initState() {
    super.initState();
    listQuestion = [];
  }

  _buildLearningComponent(List<Test> listTest, BuildContext context) {
    if (listTest.isEmpty)
      return <Widget>[];
    else {
      List<Widget> listComponent = [];
      for (var test in listTest) {
        listComponent.add(Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
          width: MediaQuery.of(context).size.width - 40,
          child: Row(
            children: [
              Expanded(
                  child: Text(
                test.question ?? "",
                style: Theme.of(context).textTheme.displayMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
              Checkbox(
                  value: listQuestion!.contains(test),
                  onChanged: (check) {
                    if (listQuestion!.contains(test)) {
                      setState(() {
                        listQuestion!.remove(test);
                      });
                    } else {
                      setState(() {
                        listQuestion!.add(test);
                      });
                    }
                  })
            ],
          ),
        ));
      }
      listComponent.add(const SizedBox(
        height: 70,
      ));
      return listComponent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final testLesson = ref.watch(getLessonProvider(widget.lesson.id!));
    return Scaffold(
      appBar: TitleAppbar(
        leadingButtonOnPressed: () => Navigator.pop(context),
        title: Text(widget.lesson.title ?? "",
            style: Theme.of(context).appBarTheme.titleTextStyle),
      ),
      body: testLesson.when(
          data: (testLesson) {
            return Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: _buildLearningComponent(
                          testLesson.listLearning! as List<Test>, context),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: PrimaryButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TestSpeedReview(
                                      listLearning: listQuestion ?? [],
                                      courseId: widget.courseId)));
                        },
                        width: MediaQuery.of(context).size.width - 40,
                        child: Text(
                          "Start",
                          style: Theme.of(context).textTheme.labelMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ))
              ],
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
