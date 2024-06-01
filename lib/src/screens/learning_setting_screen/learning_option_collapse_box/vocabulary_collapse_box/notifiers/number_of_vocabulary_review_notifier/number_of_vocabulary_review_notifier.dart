

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'number_of_vocabulary_review_notifier.g.dart';

@riverpod
class NumberOfVocabularyReviewNotifier extends _$NumberOfVocabularyReviewNotifier{
  @override
  int build(){
    return 0;
  }

  void setNumberOfVocabulary(int numberOfVocabulary){
    state = numberOfVocabulary;
  }
}
