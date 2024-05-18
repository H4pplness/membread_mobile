import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/models/vocabulary_lesson.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/study_vocabulary_screen/notifiers/learning_notifier/learning_notifier.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/study_vocabulary_screen/study_option/choose_answer.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/study_vocabulary_screen/study_option/new_vocabulary.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/primarybutton.dart';
import 'package:membreadflutter/src/widgets/atoms/sliders/progress_slider.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/close_title_appbar.dart';
import '../../../domain/models/vocabulary.dart';

class StudyVocabularyScreen extends ConsumerWidget {
  VocabularyLesson lesson;
  StudyVocabularyScreen({super.key, required this.lesson});

  List<Vocabulary> listVocabulary = [
    Vocabulary(vocabulary: "Hello", mean: "Xin chào"),
    Vocabulary(vocabulary: "Goodbye", mean: "Tạm biệt"),
    Vocabulary(vocabulary: "Welcome", mean: "Welcome"),
    Vocabulary(vocabulary: "Hi", mean: "Xin chào")
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget body;
    final learningProgress = ref.watch(learningNotifierProvider);
    if (listVocabulary.every((vocabulary) => vocabulary.studiedLevel >= 3)) {
      body = const Center(
        child: Text("SUCCESS !"),
      );
    }else{
      Vocabulary randomVocabulary;
      while (true) {
        print("OKE");
        int randomIndex = Random().nextInt(listVocabulary.length);
        randomVocabulary = listVocabulary[randomIndex];
        if (randomVocabulary.studiedLevel >= 3) continue;
        break;
      }
      if (randomVocabulary.studiedLevel == 0) {
        body = NewVocabularyOption(
            vocabulary: randomVocabulary,
            onPressed: () {
              ref.read(learningNotifierProvider.notifier).increase();
              randomVocabulary.studiedLevel++;
            });
      } else {
        body = ChooseAnswerOption(
            vocabulary: randomVocabulary.vocabulary ?? "",
            choices: [
              Choice(choice: randomVocabulary.vocabulary ?? "", isTrue: true),
              Choice(choice: "A", isTrue: false),
              Choice(choice: "B", isTrue: false),
              Choice(choice: "C", isTrue: false),
            ],
            onTap: (isTrue) {
              print("Progress : $learningProgress");
              ref.read(learningNotifierProvider.notifier).increase();
              if(isTrue){
                randomVocabulary.studiedLevel++;
              }
            });
      }
    }
    int correctAnswer = 0;
    listVocabulary.forEach((vocabulary) {
      correctAnswer += vocabulary.studiedLevel;
    });

    return Scaffold(
      appBar: CloseTitleAppbar(
        onLeadingButtonPressed: () => Navigator.pop(context),
      ),
      body: Container(
        child: Column(
          children: [
            ProgressSlider(
              progress: correctAnswer / (listVocabulary.length*3),
              width: MediaQuery.of(context).size.width,
              contentColor: Theme.of(context).primaryColor,
              outLineColor: Theme.of(context).colorScheme.secondary,
              borderRadius: 0,
            ),
            body
            // NewVocabularyOption(vocabulary: listVocabulary[0],)
            // _generateQuestion(0,ref)
          ],
        ),
      ),
    );
  }
}
