import 'package:membreadflutter/src/domain/models/learning.dart';

class Lesson<T extends Learning> {
  int? id;
  String? title;
  String? description;
  // String type = T.;

  List<T>? listLearning;

  Lesson({this.id,this.title,this.description,this.listLearning});
}


enum LessonType{
  VOCABULARY,
  TEST
}

extension LessonTypeExtension on LessonType{
  String get value {
    switch(this){
      case LessonType.VOCABULARY:
        return "Vocabulary";
      case LessonType.TEST:
        return 'Test';
    }
  }

  static LessonType fromString(String value){
    switch(value){
      case "Vocabulary":
        return LessonType.VOCABULARY;
      case "Test" :
        return LessonType.TEST;
      default:
        throw ArgumentError('Invalid honor value: $value');
    }
  }
}