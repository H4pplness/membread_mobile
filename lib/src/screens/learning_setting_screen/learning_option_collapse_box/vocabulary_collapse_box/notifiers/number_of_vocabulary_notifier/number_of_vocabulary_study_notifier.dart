
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'number_of_vocabulary_study_notifier.g.dart';
@riverpod
class NumberOfVocabularyStudyNotifier extends _$NumberOfVocabularyStudyNotifier {
  @override
  int build() {
    return 0;
  }

  void setNumberOfVocabulary(int numberOfVocabulary){
    state = numberOfVocabulary;
  }
}