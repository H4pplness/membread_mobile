
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../domain/models/vocabulary.dart';
import '../../../../../dtos/vocabularydto/vocabularydto.dart';

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