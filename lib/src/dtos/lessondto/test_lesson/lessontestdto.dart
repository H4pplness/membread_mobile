import 'package:membreadflutter/src/dtos/learningdto/multichoicedto/multichoicedto.dart';
import 'package:membreadflutter/src/dtos/learningdto/shortanswerdto/shortanswerdto.dart';

import '../../learningdto/testdto/testdto.dart';


class LessonTestDTO {
  int? id;
  String? title;
  String? description;
  List<TestDTO>? listLearning;

  LessonTestDTO({this.id, this.description, this.listLearning,this.title});

  factory LessonTestDTO.fromJson(Map<String,dynamic> json){
    var listLearning = json['listLearning'] as List;
    List<TestDTO> learningList = listLearning.map((e){
      if(e.containsKey('short-answer')){
        return ShortAnswerDTO.fromJson(e);
      }
      if(e.containsKey('correct-answer')){
        return MultiChoiceDTO.fromJson(e);
      }
      throw Exception();
    }).toList();

    return LessonTestDTO(
      id: json['id'],
      description: json['description'],
      title: json['title'],
      listLearning: learningList
    );
  }
}