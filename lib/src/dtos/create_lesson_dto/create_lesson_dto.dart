
import 'package:membreadflutter/src/dtos/lesson_type_dto/learning_dto.dart';

class CreateLessonDTO {
  String? title;
  String? description;
  int? courseId;
  List<LearningDTO>? listLearning;

  CreateLessonDTO({this.title,this.description,this.courseId,this.listLearning});

  Map<String,dynamic> toJson() => {
    'title' : title,
    'description' : description,
    'courseId' : courseId,
    'listLearning' : listLearning
  };
}