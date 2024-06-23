
import 'package:membreadflutter/src/domain/models/test.dart';

class ShortAnswer extends Test{
  String? shortAnswer;

  ShortAnswer({super.id,super.progress,super.question,this.shortAnswer,super.studiedLevel =0});
}