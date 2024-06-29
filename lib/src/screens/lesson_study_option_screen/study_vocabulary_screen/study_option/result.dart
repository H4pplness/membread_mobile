import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/speed_review_screen/notifier/result_notifier/result_notifier.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/study_vocabulary_screen/notifiers/list_vocabulary_notifier/list_vocabulary_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/primarybutton.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/voca_card.dart';

import '../../../../domain/models/vocabulary.dart';

class ResultOption extends ConsumerWidget {
  Function()? backFunction;

  ResultOption({super.key, this.backFunction});

  _buildListReview(List<Vocabulary> list) {
    List<Widget> vocabularyComponents = [];
    for (var vocabulary in list) {
      if(vocabulary.studiedLevel>0){
        vocabularyComponents.add(VocaCard(
          voca: vocabulary.vocabulary ?? "",
          mean: vocabulary.mean ?? "",
          level: vocabulary.progress,
        ));
      }
    }
    return vocabularyComponents;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listVocabulary = ref.watch(listVocabularyProvider);
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 60),
          height: MediaQuery.of(context).size.height - 120,
          child: SingleChildScrollView(
            child: Column(
              children: _buildListReview(listVocabulary),
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
