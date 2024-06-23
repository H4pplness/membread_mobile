

class ChoiceTestDTO {
  String? question;
  bool isCorrect;

  ChoiceTestDTO({this.question,this.isCorrect = false});

  Map<String,dynamic> toJson()=>{
    'question' : question,
    'isCorrect' : isCorrect
  };
}