import 'package:membreadflutter/src/domain/models/test.dart';

class MultiChoice extends Test{
  String? choice1;
  String? choice2;
  String? choice3;
  String? choice4;
  int? correctAnswer;

  MultiChoice({super.id,super.progress,super.question,this.choice1, this.choice2, this.choice3, this.choice4,
      this.correctAnswer,super.studiedLevel =0});
}