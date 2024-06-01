
import 'package:membreadflutter/src/domain/models/lesson.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lesson_type_notifier.g.dart';



@riverpod
class LessonTypeNotifier extends _$LessonTypeNotifier {
  @override
  LessonType build(){
    return LessonType.VOCABULARY;
  }

  void setType(LessonType type){
    state = type;
  }
}