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
  GRAMMAR,
  VIDEO,
  ALGEBRA
}

extension LessonTypeExtension on LessonType{
  String get value {
    switch(this){
      case LessonType.VOCABULARY:
        return "Vocabulary";
      case LessonType.GRAMMAR:
        return "Grammar";
      case LessonType.VIDEO :
        return "Video";
      case LessonType.ALGEBRA:
        return "Algebra";
    }
  }

  static LessonType fromString(String value){
    switch(value){
      case "Vocabulary":
        return LessonType.VOCABULARY;
      case "Grammar" :
        return LessonType.GRAMMAR;
      case "Video" :
        return LessonType.VIDEO;
      case "Algebra" :
        return LessonType.ALGEBRA;
      default:
        throw ArgumentError('Invalid honor value: $value');
    }
  }
}