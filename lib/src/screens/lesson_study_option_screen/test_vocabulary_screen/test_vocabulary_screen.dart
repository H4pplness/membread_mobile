import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/study_vocabulary_screen/study_option/choose_answer.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/test_vocabulary_screen/notifiers/progress_notifier/progress_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/sliders/progress_slider.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/close_title_appbar.dart';
import '../../../domain/models/vocabulary.dart';

class TestVocabularyScreen extends ConsumerWidget {
  List<Vocabulary> listVocabulary;
  TestVocabularyScreen({super.key, required this.listVocabulary});

  List<Vocabulary> getRandomElements(List<Vocabulary> list, int count) {
    if (count > list.length) {
      throw ArgumentError(
          'Count cannot be greater than the length of the list');
    }

    Random random = Random();
    List<int> indices = [];

    while (indices.length < count) {
      int index = random.nextInt(list.length);
      if (!indices.contains(index)) {
        indices.add(index);
      }
    }

    List<Vocabulary> randomElements =
        indices.map((index) => list[index]).toList();

    return randomElements;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressNotifierProvider);

    Widget body;

    if (listVocabulary.length <= 3) {
      body = Center(
          child: Text(
            "Something wrong :v",
            style: Theme
                .of(context)
                .textTheme
                .titleMedium,
          ));
    }else{
      if (listVocabulary.every((vocabulary) => vocabulary.studiedLevel > 0)) {
        body = const Center(
          child: Text("SUCCESS"),
        );
      } else {
        Vocabulary randomVocabulary;
        while (true) {
          print("PROGRESS : $progress , ${listVocabulary.length}");
          int randomIndex = Random().nextInt(listVocabulary.length);
          randomVocabulary = listVocabulary[randomIndex];
          if (randomVocabulary.studiedLevel > 0) continue;
          break;
        }

        final randomChoice = getRandomElements(
            listVocabulary
                .where((vocabulary) => vocabulary != randomVocabulary)
                .toList(),
            3);
        final listChoice = [
          Choice(choice: randomVocabulary.mean ?? "", isTrue: true),
          Choice(choice: randomChoice[0].mean ?? "", isTrue: false),
          Choice(choice: randomChoice[1].mean ?? "", isTrue: false),
          Choice(choice: randomChoice[2].mean ?? "", isTrue: false),
        ];
        listChoice.shuffle(Random());

        body = ChooseAnswerOption(
            vocabulary: randomVocabulary.vocabulary ?? "",
            choices: listChoice,
            onTap: (isTrue) {
              ref.read(progressNotifierProvider.notifier).increase();
              randomVocabulary.studiedLevel++;
            });
      }
    }

    return Scaffold(
      appBar: CloseTitleAppbar(
        onLeadingButtonPressed: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          ProgressSlider(
            progress: progress / listVocabulary.length,
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
