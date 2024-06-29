
import 'package:membreadflutter/src/dtos/lesson_type_dto/learning_dto.dart';
import 'package:membreadflutter/src/dtos/lesson_type_dto/test_dto/choice_test_dto.dart';

class CreateTestDTO extends LearningDTO{
  String? question;
  ChoiceTestDTO? choice1;
  ChoiceTestDTO? choice2;
  ChoiceTestDTO? choice3;
  ChoiceTestDTO? choice4;

  CreateTestDTO({this.question,this.choice1,this.choice2,this.choice3,this.choice4});

  Map<String,dynamic> toJson()=>{
    'question' : question,
    'choice1' : choice1!.toJson(),
    'choice2' : choice2!.toJson(),
    'choice3' : choice3!.toJson(),
    'choice4' : choice4!.toJson(),
    'type' : 'choose'
  };

  CreateTestDTO copyWith({
    String? question,
    ChoiceTestDTO? choice1,
    ChoiceTestDTO? choice2,
    ChoiceTestDTO? choice3,
    ChoiceTestDTO? choice4,
  }) {
    return CreateTestDTO(
      question: question ?? this.question,
      choice1: choice1 ?? this.choice1,
      choice2: choice2 ?? this.choice2,
      choice3: choice3 ?? this.choice3,
      choice4: choice4 ?? this.choice4,
    );
  }
}