import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/speed_review_screen/notifier/result_notifier/result_notifier.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/speed_review_screen/study_option/choose_answer.dart';
import 'package:membreadflutter/src/widgets/atoms/sliders/auto_decrease_slider.dart';
import 'package:membreadflutter/src/widgets/molecules/icon_group/heal_group.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/close_title_appbar.dart';

class SpeedReviewScreen extends ConsumerWidget {
  SpeedReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultState = ref.watch(resultNotifierProvider);
    final isEnd = ref.read(resultNotifierProvider.notifier).isEnd();
    Widget body;
    if (isEnd == 0) {
      body = const Center(
        child: Text("FAILED"),
      );
    } else if (isEnd == 1) {
      body = const Center(
        child: Text("SUCCESS"),
      );
    } else {
      body = ChooseAnswerOption(
          vocabulary: "",
          choices: [
            Choice(choice: resultState.questionIndex.toString(), isTrue: true),
            Choice(choice: "A", isTrue: false),
            Choice(choice: "B", isTrue: false),
            Choice(choice: "C", isTrue: false),
          ],
          onTap: (isTrue) {
            Future.delayed(const Duration(milliseconds: 500), () {
              autoDecreaseSliderKey.currentState?.resetSlider();
              if (!isTrue) {
                ref.read(resultNotifierProvider.notifier).wrongAnswerOrEnd();
              } else {
                ref.read(resultNotifierProvider.notifier).nextQuestion();
              }
            });
          });
    }

    return Scaffold(
        appBar: CloseTitleAppbar(
          onLeadingButtonPressed: () => Navigator.pop(context),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isEnd == 2 ?AutoDecreaseSlider(
              key: autoDecreaseSliderKey,
              width: MediaQuery.of(context).size.width,
              height: 10,
              color: Theme.of(context).primaryColor,
              timeSecond: 5,
              onEnd: () async {
                await Future.delayed(const Duration(milliseconds: 200));
                print("IS end");
                ref.read(resultNotifierProvider.notifier).wrongAnswerOrEnd();
              },
            ) : Container(),
            isEnd == 2 ? Container(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: HealGroup(healNumber: resultState.remainHeal)) : Container(),
            body
          ],
        ));
  }
}
