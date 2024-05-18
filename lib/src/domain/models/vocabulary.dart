import 'package:membreadflutter/src/domain/models/learning.dart';

class Vocabulary extends Learning{
  String? vocabulary;
  String? mean;
  List<String>? example;
  String? explain;
  int? progress;
  int studiedLevel;
  Vocabulary({super.id ,this.vocabulary, this.mean,this.example,this.explain,this.progress,this.studiedLevel = 0});

  @override
  List<Object?> get props => [id, vocabulary, mean];
}