
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../dtos/lesson_type_dto/vocabularydto/vocabularydto.dart';

part 'list_vocabulary_notifier.g.dart';

@riverpod
class ListVocabularyNotifier extends _$ListVocabularyNotifier {
  @override
  List<VocabularyDTO> build()
  {
    return [];
  }

  void addVocabulary(VocabularyDTO vocabulary) {
    state = [...state, vocabulary];
  }

  void deleteVocabulary(int index) {
    state = List.from(state)..removeAt(index);
  }
}