import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/domain/models/multichoice.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/test/speed_review/notifier/result_speed_test.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/primarybutton.dart';
import 'package:membreadflutter/src/widgets/atoms/chart/speed_test_chart.dart';

import '../../../../../domain/repositories/course_repository/update_progress_lesson/update_progress_lesson.dart';
import '../../../../../dtos/updateprogresslessondto/update_progress_lesson_vocabulary_dto.dart';
import '../notifier/score_speed_test.dart';

class TestResultComponent extends ConsumerWidget {
  int course_id;
  int lesson_id;
  TestResultComponent(
      {super.key, required this.course_id, required this.lesson_id});

  _buildListResultComponent(
      List<SpeedTestResult> listResult, BuildContext context) {
    List<Widget> resultComponents = [];
    for (var result in listResult) {
      if (result.test is MultiChoice) {
        final multichoiceResult = result.test as MultiChoice;
        resultComponents.add(Container(
          width: MediaQuery.of(context).size.width - 40,
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Question: ${result.test.question}",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                multichoiceResult.choice1 ?? "",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                multichoiceResult.choice2 ?? "",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                multichoiceResult.choice3 ?? "",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                multichoiceResult.choice4 ?? "",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Your choice: ${result.choice}",
                style: result.choice == result.correctAnswer
                    ? Theme.of(context).textTheme.displaySmall
                    : GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
              ),
              Text(
                "Correct answer: ${result.correctAnswer}",
                style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ));
      }
    }
    return resultComponents;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(resultSpeedTestProvider);
    final statistic =
        ref.watch(resultSpeedTestProvider.notifier).getStatistic();
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: SpeedTestChart(
                          trueAnswer: statistic['true'] ?? 0,
                          total: statistic['total'] ?? 0,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Correct : ${statistic['true']}",
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Wrong : ${statistic['total'] - statistic['true']}",
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Your answer :",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: _buildListResultComponent(result, context),
                  ),
                ),
              ))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: PrimaryButton(
              onPressed: () async {
                final learned = UpdateProgressLessonVocabularyDTO(
                  course_id: course_id,
                  lesson_id: lesson_id,
                  score: ref.watch(scoreSpeedTestProvider).totalScore,
                );
                await ref.read(updateProgressLessonProvider(learned).future);

                ref.refresh(scoreSpeedTestProvider);
                ref.refresh(resultSpeedTestProvider);
                Navigator.pop(context);
              },
              width: MediaQuery.of(context).size.width - 40,
              child: Text(
                "Submit",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
