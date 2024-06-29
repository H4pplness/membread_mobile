import 'package:membreadflutter/src/domain/models/learning.dart';

class Lesson<T extends Learning> {
  int? id;
  String? title;
  String? description;
  // String type = T.;

  List<T>? listLearning;

  Lesson({this.id,this.title,this.description,this.listLearning});

  Lesson copyWith({
    int? id,
    String? title,
    String? description,
    List<T>? listLearning
  }){
    return Lesson(
      id: id??this.id,
      title: title??this.title,
      description: description??this.description,
      listLearning: listLearning??this.listLearning
    );
  }

  void updateLearningList(List<T> newLearnings) {
    final updatedList = listLearning?.map((learning) {
      final newLearning = newLearnings.firstWhere(
              (newLearning) => newLearning.id == learning.id,
          orElse: () => learning);
      return newLearning;
    }).toList();
    listLearning = updatedList;
  }
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