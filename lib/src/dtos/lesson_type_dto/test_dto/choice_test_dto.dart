

class ChoiceTestDTO {
  String? content;
  bool isCorrect;

  ChoiceTestDTO({this.content,this.isCorrect = false});

  Map<String,dynamic> toJson()=>{
    'content' : content,
    'isCorrect' : isCorrect
  };
}