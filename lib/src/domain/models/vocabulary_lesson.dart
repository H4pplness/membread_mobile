import 'package:membreadflutter/src/domain/models/lesson.dart';
import 'package:membreadflutter/src/domain/models/vocabulary.dart';

class VocabularyLesson extends Lesson<Vocabulary>{
  VocabularyLesson({super.id, super.title, super.description, super.listLearning});
}