import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/models/vocabulary.dart';

class SpeedReviewListQuestion {
  List<Vocabulary>? listVocabulary;
  List<Vocabulary>? listQuestion;

  SpeedReviewListQuestion({this.listVocabulary, this.listQuestion});

  SpeedReviewListQuestion copyWith(
      {List<Vocabulary>? listVocabulary, List<Vocabulary>? listQuestion}) {
    return SpeedReviewListQuestion(
        listVocabulary: listVocabulary ?? this.listVocabulary,
        listQuestion: listQuestion ?? this.listQuestion);
  }
}

class GetQuestionNotifier extends StateNotifier<SpeedReviewListQuestion> {
  final Ref ref;
  GetQuestionNotifier(this.ref)
      : super(SpeedReviewListQuestion(listQuestion: [], listVocabulary: []));

  setListVocabulary(List<Vocabulary> list) {
    state = state.copyWith(listVocabulary: list);
  }

  isEnd() {
    if (state.listQuestion == null ||
        state.listQuestion!.isEmpty ||
        state.listVocabulary == null) {
      return false;
    }
    int numberOfQuestion = state.listQuestion!.length;

    if (state.listVocabulary!
        .every((element) => element.studiedLevel > 0 || numberOfQuestion >= 25))
      return true;
    else {
      return false;
    }
  }

  getQuestion() {
    if (state.listVocabulary == null) return null;
    if (state.listVocabulary!.isEmpty) return null;
    if (state.listVocabulary!.length < 5) return null;
    if (state.listVocabulary!.every((element) => element.studiedLevel > 0))
      return null;

    final length = state.listVocabulary!.length;
    int randomI;
    Random random = Random();
    while(true){
      randomI = random.nextInt(length);
      if(state.listVocabulary![randomI].studiedLevel==0)break;
    }
    final vocabulary = state.listVocabulary![randomI];

    final index = state.listVocabulary!.indexOf(vocabulary);
    if (index != -1) {
      state.listVocabulary![index] =
          vocabulary.copyWith(studiedLevel: vocabulary.studiedLevel + 1);
    }



    final List<String> listAnswer = [vocabulary.mean ?? ""];
    for (int i = 0; i < 3; i++) {
      while (true) {
        int randomIndex = random.nextInt(length);
        final randomVocabulary = state.listVocabulary![randomIndex];
        if (listAnswer.contains(randomVocabulary.mean))
          continue;
        else {
          listAnswer.add(randomVocabulary.mean ?? "");
          break;
        }
      }
    }

    return {"question": vocabulary, "answers": listAnswer};
  }

  addQuestion(Vocabulary vocabulary){
    print("TU MOI HOC : ${vocabulary.vocabulary}");
    state = state.copyWith(listQuestion: [...state.listQuestion!,vocabulary]);
  }

}

final getQuestionNotifierProvider =
    StateNotifierProvider<GetQuestionNotifier, SpeedReviewListQuestion>(
        (ref) => GetQuestionNotifier(ref));
