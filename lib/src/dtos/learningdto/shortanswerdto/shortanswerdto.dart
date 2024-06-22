
import '../testdto/testdto.dart';

class ShortAnswerDTO extends TestDTO{
  String? shortAnswer;

  ShortAnswerDTO({id,progress,question,this.shortAnswer}) : super(id: id,question: question,progress: progress);

  factory ShortAnswerDTO.fromJson(Map<String,dynamic> json){
    return ShortAnswerDTO(
      id: json['id'],
      question: json['question'],
      progress: json['progress'],
      shortAnswer: json['short-answer']
    );
  }
}