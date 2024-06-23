import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/models/multichoice.dart';
import 'package:membreadflutter/src/domain/models/short_answer.dart';
import 'package:membreadflutter/src/domain/models/test.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/test/speed_review/notifier/test_speed_progress_notifier.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/test/speed_review/option/multichoice_component.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/test/speed_review/option/short_answer_component.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/close_title_appbar.dart';

import '../../../../domain/models/test_lesson.dart';

class TestSpeedReview extends ConsumerStatefulWidget {
  TestLesson lesson;
  int courseId;
  TestSpeedReview({super.key, required this.lesson, required this.courseId});

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
            .initial(widget.lesson.listLearning!);
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
            print("DA CHON");
            _removeQuestion(question);
          },
        );
      } else {
        body = ShortAnswerComponent(
          question: question as ShortAnswer,
          onTap: () {
            print("DA CHON");
            _removeQuestion(question);
          }
        );
      }
    } else {
      body = Container();
    }

    return Scaffold(
      appBar: CloseTitleAppbar(
        onLeadingButtonPressed: () => Navigator.pop(context),
      ),
      body: body,
    );
  }
}
