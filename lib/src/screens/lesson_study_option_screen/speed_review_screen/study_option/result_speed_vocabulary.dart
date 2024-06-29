import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/speed_review_screen/notifier/get_question/get_question_notifier.dart';

import '../../../../domain/models/vocabulary.dart';
import '../../../../widgets/atoms/buttons/primarybutton.dart';
import '../../../../widgets/atoms/cards/voca_card.dart';

class ResultSpeedVocabulary extends ConsumerWidget {
  Function()? backFunction;

  ResultSpeedVocabulary({super.key, this.backFunction});

  _buildListReview(List<Vocabulary> list) {
    List<Widget> vocabularyComponents = [];
    print("LIST : $list");
    for (var vocabulary in list) {
      vocabularyComponents.add(VocaCard(
        voca: vocabulary.vocabulary ?? "",
        mean: vocabulary.mean ?? "",
        level: vocabulary.progress,
        needToReview: vocabulary.needToReview,
      ));
    }
    return vocabularyComponents;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listVocabulary = ref.watch(getQuestionNotifierProvider);
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 60),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 120,
          child: SingleChildScrollView(
            child: Column(
              children: _buildListReview(listVocabulary.listQuestion!),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: PrimaryButton(
            onPressed: () => backFunction!(),
            width: MediaQuery.of(context).size.width - 40,
            child: Center(
              child: Text(
                "Back",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        )
      ],
    );
  }
}
