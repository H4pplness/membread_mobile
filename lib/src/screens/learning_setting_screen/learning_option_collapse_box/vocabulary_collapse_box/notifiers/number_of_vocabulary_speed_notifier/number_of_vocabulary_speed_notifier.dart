

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'number_of_vocabulary_speed_notifier.g.dart';

@riverpod
class NumberOfVocabularySpeedNotifier extends _$NumberOfVocabularySpeedNotifier{
  @override
  int build(){
    return 0;
  }

  void setNumberOfVocabulary(int numberOfVocabulary){
    state = numberOfVocabulary;
  }
}
