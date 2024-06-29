import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/domain/models/multichoice.dart';
import 'package:membreadflutter/src/domain/models/short_answer.dart';
import 'package:membreadflutter/src/domain/models/test.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/test/speed_review/notifier/result_speed_test.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/test/speed_review/notifier/score_speed_test.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/test/speed_review/notifier/test_speed_progress_notifier.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/test/speed_review/option/multichoice_component.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/test/speed_review/option/short_answer_component.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/test/speed_review/option/test_result_component.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/close_title_appbar.dart';

class TestSpeedReview extends ConsumerStatefulWidget {
  List<Test> listLearning;
  int courseId;
  int lessonId;
  TestSpeedReview(
      {super.key, required this.listLearning, required this.courseId,required this.lessonId});

  @override
  ConsumerState<TestSpeedReview> createState() => _TestSpeedReviewState();
}

class _TestSpeedReviewState extends ConsumerState<TestSpeedReview> {
  bool _isFirstTime = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isFirstTime) {
      _isFirstTime = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(testSpeedProgressNotifierProvider.notifier)
            .initial(widget.listLearning);
      });
    }
  }

  void _removeQuestion(Test question) {
    ref
        .read(testSpeedProgressNotifierProvider.notifier)
        .removeQuestion(question);
  }

  @override
  Widget build(BuildContext context) {
    final testProgressNotifier = ref.watch(testSpeedProgressNotifierProvider);
    final question =
        ref.watch(testSpeedProgressNotifierProvider.notifier).getQuestion();

    Widget body;
    if (question != null) {
      if (question is MultiChoice) {
        body = MultichoiceComponent(
          question: question,
          onTap: (isTrue) {
            _removeQuestion(question);
            if (isTrue) {
              ref.watch(scoreSpeedTestProvider.notifier).correctAnswer();
            }
          },
        );
      } else {
        body = ShortAnswerComponent(
            question: question as ShortAnswer,
            onTap: () {
              _removeQuestion(question);
            });
      }
    } else {
      body = TestResultComponent(course_id: widget.courseId, lesson_id: widget.lessonId,);
    }
    final score = ref.watch(scoreSpeedTestProvider);

    return Scaffold(
      appBar: CloseTitleAppbar(
        onLeadingButtonPressed: () {
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: Text('Warning !',style: GoogleFonts.montserrat(fontSize:23,color:Colors.red,fontWeight:FontWeight.w600),),
                    content: Text('If you exit, the results will not be saved.',style: Theme.of(context).textTheme.displayMedium,),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: Text('Cancel',style: Theme.of(context).textTheme.displayMedium,),
                      ),
                      TextButton(
                        onPressed: () {
                          ref.refresh(resultSpeedTestProvider);
                          ref.refresh(scoreSpeedTestProvider);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text('Ok',style: Theme.of(context).textTheme.displayMedium),
                      ),
                    ],
                  ));
        },
        actions: [
          Text(
            score.totalScore.toString(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: body,
    );
  }
}
