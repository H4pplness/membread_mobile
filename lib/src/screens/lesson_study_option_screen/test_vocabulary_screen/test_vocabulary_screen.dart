import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/study_vocabulary_screen/study_option/choose_answer.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/test_vocabulary_screen/notifiers/progress_notifier/progress_notifier.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/test_vocabulary_screen/notifiers/test_choice_notifier/test_choice_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/sliders/progress_slider.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/close_title_appbar.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/title_appbar.dart';

import '../../../domain/models/vocabulary.dart';
import '../../../domain/models/vocabulary_lesson.dart';

class TestVocabularyScreen extends ConsumerWidget {
  VocabularyLesson lesson;
  TestVocabularyScreen({super.key,required this.lesson});

  List<Vocabulary> listVocabulary = [
    Vocabulary(vocabulary: "Hello", mean: "Xin chào"),
    Vocabulary(vocabulary: "Goodbye", mean: "Tạm biệt"),
    Vocabulary(vocabulary: "Welcome", mean: "Welcome"),
    Vocabulary(vocabulary: "Hi", mean: "Xin chào")
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressNotifierProvider);

    Widget body;
    if(listVocabulary.every((vocabulary) => vocabulary.studiedLevel>0)){
      body = const Center(
        child: Text("SUCCESS"),
      );
    }else{
      Vocabulary randomVocabulary;
      while(true){
        print("PROGRESS : $progress , ${listVocabulary.length}");
        int randomIndex = Random().nextInt(listVocabulary.length);
        randomVocabulary = listVocabulary[randomIndex];
        if(randomVocabulary.studiedLevel>0)continue;
        break;
      }

      body = ChooseAnswerOption(vocabulary: randomVocabulary.vocabulary??"", choices: [
        Choice(choice: randomVocabulary.vocabulary ?? "", isTrue: true),
        Choice(choice: "A", isTrue: false),
        Choice(choice: "B", isTrue: false),
        Choice(choice: "C", isTrue: false),
      ],
          onTap: (isTrue){
            ref.read(progressNotifierProvider.notifier).increase();
            randomVocabulary.studiedLevel++;
          });

    }

    return Scaffold(
      appBar: CloseTitleAppbar(
        onLeadingButtonPressed: ()=>Navigator.pop(context),
      ),
      body: Column(
        children: [
          ProgressSlider(
            progress: progress/listVocabulary.length,
            width: MediaQuery.of(context).size.width,
            contentColor: Theme.of(context).primaryColor,
            outLineColor: Theme.of(context).colorScheme.secondary,
            borderRadius: 0,
          ),
          body
        ],
      ),
    );
  }
}
