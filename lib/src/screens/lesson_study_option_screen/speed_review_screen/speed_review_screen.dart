import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/speed_review_screen/notifier/get_question/get_question_notifier.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/speed_review_screen/notifier/result_notifier/result_notifier.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/speed_review_screen/study_option/choose_answer.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/speed_review_screen/study_option/result_speed_vocabulary.dart';
import 'package:membreadflutter/src/widgets/atoms/sliders/auto_decrease_slider.dart';
import 'package:membreadflutter/src/widgets/molecules/icon_group/heal_group.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/close_title_appbar.dart';

import '../../../domain/models/vocabulary.dart';
import '../../../domain/repositories/course_repository/get_lesson/get_lesson.dart';
import '../../../domain/repositories/course_repository/update_progress_lesson/update_progress_lesson.dart';
import '../../../dtos/progressvocabularydto/progress_vocabulary_dto.dart';
import '../../../dtos/updateprogresslessondto/update_progress_lesson_vocabulary_dto.dart';
import 'notifier/score_notifier/score_notifier.dart';

class SpeedReviewScreen extends ConsumerStatefulWidget {
  List<Vocabulary> listVocabulary;
  int courseId;
  int lessonId;
  SpeedReviewScreen(
      {super.key,
      required this.listVocabulary,
      required this.courseId,
      required this.lessonId});

  @override
  ConsumerState<SpeedReviewScreen> createState() => _SpeedReviewScreenState();
}

class _SpeedReviewScreenState extends ConsumerState<SpeedReviewScreen> {
  bool _isFirstTime = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isFirstTime) {
      _isFirstTime = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.refresh(getQuestionNotifierProvider);
        ref
            .watch(getQuestionNotifierProvider.notifier)
            .setListVocabulary(widget.listVocabulary);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final resultState = ref.watch(resultNotifierProvider);
    final resultNotifier = ref.watch(resultNotifierProvider.notifier);
    final isEnd = resultNotifier.isEnd();
    final score = ref.watch(scoreSpeedReviewVocabularyProvider);
    Widget body;
    if (isEnd == 0 || isEnd == 1) {
      print("IS END 2");
      body = ResultSpeedVocabulary(backFunction: () async {
        final listVocabulary =
            ref.watch(getQuestionNotifierProvider).listQuestion!;
        await ref.watch(getLessonProvider.notifier).updateProgress(
            listVocabulary, score.totalScore, widget.courseId, widget.lessonId);
        ref.refresh(resultNotifierProvider);
        ref.refresh(scoreSpeedReviewVocabularyProvider);
        Navigator.pop(context);
      });
    } else {
      final question =
          ref.watch(getQuestionNotifierProvider.notifier).getQuestion();
      if (question == null) {
        body = ResultSpeedVocabulary();
      } else {
        final listChoice = [
          Choice(choice: question["answers"][0], isTrue: true),
          Choice(choice: question["answers"][1], isTrue: false),
          Choice(choice: question["answers"][2], isTrue: false),
          Choice(choice: question["answers"][3], isTrue: false),
        ];
        listChoice.shuffle();
        body = ChooseAnswerOption(
            vocabulary: question["question"],
            choices: listChoice,
            onTap: (isTrue) async {
              autoDecreaseSliderKey.currentState?.resetSlider();
              if (!isTrue) {
                Vocabulary falseAnswer = question["question"];
                falseAnswer.needToReview = true;
                ref
                    .watch(getQuestionNotifierProvider.notifier)
                    .addQuestion(falseAnswer);
                ref.watch(resultNotifierProvider.notifier).wrongAnswerOrEnd();
              } else {
                Vocabulary trueAnswer = question["question"];
                trueAnswer.needToReview = false;
                ref
                    .watch(getQuestionNotifierProvider.notifier)
                    .addQuestion(trueAnswer);
                ref.watch(resultNotifierProvider.notifier).nextQuestion();
              }
            });
      }
    }

    return Scaffold(
        appBar: CloseTitleAppbar(
          onLeadingButtonPressed: () => Navigator.pop(context),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isEnd == 2
                ? AutoDecreaseSlider(
                    key: autoDecreaseSliderKey,
                    width: MediaQuery.of(context).size.width,
                    height: 10,
                    color: Theme.of(context).primaryColor,
                    timeSecond: 5,
                    onEnd: () async {
                      ref
                          .watch(resultNotifierProvider.notifier)
                          .wrongAnswerOrEnd();
                    },
                  )
                : Container(),
            isEnd == 2
                ? Container(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: HealGroup(healNumber: resultState.remainHeal))
                : Container(),
            body
          ],
        ));
  }
}
