
import 'package:membreadflutter/src/domain/models/learning.dart';

class Test extends Learning{
  int? progress;
  String? question;
  int? studiedLevel;
  Test({super.id,this.progress, this.question,this.studiedLevel = 0});
}