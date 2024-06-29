import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/models/vocabulary.dart';

class ListVocabularyNotifier extends StateNotifier<List<Vocabulary>> {
  final Ref ref;
  final numberOfVocabulary = 5;
  final numberOfVocabularyForTest = 15;
  int vocabularyLength = 0; // Số lượng vocabulary đã làm

  ListVocabularyNotifier(this.ref) : super([]);

  setListVocabulary(List<Vocabulary> listVocabulary) {
    state = listVocabulary;
  }

  Vocabulary getVocabulary() {
    Vocabulary vocabulary;

    print("LENGTH : ${state.length}");

    var listNeedToReview =
        state.where((element) => element.needToReview).toList();

    if (vocabularyLength == numberOfVocabulary) {
      Random random = Random();
      final listRemainVocab = state
          .where((e) => e.studiedLevel > 0 && e.studiedLevel < 3)
          .toList();
      int randomIndex = random.nextInt(listRemainVocab.length);
      vocabulary = listRemainVocab[randomIndex];
    } else {
      if (listNeedToReview.isNotEmpty) {
        Random random = Random();
        int randomIndex = random.nextInt(listNeedToReview.length);
        vocabulary = listNeedToReview[randomIndex];
      } else {
        List<int> listIndex = [];
        for (int i = 0; i < 5; i++) {
          int index = -1;
          double maxRate = -1;
          for (var vocab in state) {
            if (vocab.lastUpdated == null &&
                !listIndex.contains(state.indexOf(vocab))) {
              listIndex.add(state.indexOf(vocab));
            } else {
              DateTime now = DateTime.now();
              final lastUpdated = vocab.lastUpdated;
              final difference = now.difference(lastUpdated!).inHours;
              final rate = difference / (vocab.progress + 1);

              if (maxRate < rate && !listIndex.contains(state.indexOf(vocab))) {
                print("VOCA : ${vocab.vocabulary} , RATE : $rate}");
                maxRate = rate;
                index = state.indexOf(vocab);
              }
            }
          }

          print("INDEX : $index");
          listIndex.add(index);
        }
        print("LIST INDEX LENGTH : ${listIndex.length}");
        int randomIndex;
        Random random = Random();
        while (true) {
          randomIndex = random.nextInt(5);
          print("RANDOM INDEX : $randomIndex");
          if (state[listIndex[randomIndex]].studiedLevel >= 3)
            continue;
          else
            break;
        }
        vocabulary = state[listIndex[randomIndex]];
      }
    }
    if (vocabulary.studiedLevel == 0) {
      vocabularyLength++;
    }
    return vocabulary;
  }

  setNeedToReview(Vocabulary? vocabulary) {
    if (vocabulary == null) return;
    List<Vocabulary> cloneState = List.from(state);
    final vocab = cloneState.firstWhere((e) => e.id == vocabulary.id);
    vocab.needToReview = false;
    state = cloneState;
  }
}

final listVocabularyProvider =
    StateNotifierProvider<ListVocabularyNotifier, List<Vocabulary>>(
        (ref) => ListVocabularyNotifier(ref));
