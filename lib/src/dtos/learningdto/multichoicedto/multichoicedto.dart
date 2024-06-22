import 'package:membreadflutter/src/dtos/learningdto/testdto/testdto.dart';

class MultiChoiceDTO extends TestDTO{
  String? choice1;
  String? choice2;
  String? choice3;
  String? choice4;
  int? correctAnswer;


  MultiChoiceDTO({id,question,progress,this.choice1, this.choice2, this.choice3, this.choice4,
      this.correctAnswer}) : super(id: id,question: question,progress: progress);

  factory MultiChoiceDTO.fromJson(Map<String,dynamic> json){
    return MultiChoiceDTO(
      id : json['id'],
      progress: json['progress'],
      question: json['question'],
      choice1: json['choice1'],
      choice2: json['choice2'],
      choice3: json['choice3'],
      choice4: json['choice4'],
      correctAnswer: json['correct-answer']
    );
  }
}