import 'package:membreadflutter/src/domain/models/learning.dart';

class Vocabulary extends Learning{
  String? vocabulary;
  String? mean;
  List<String>? example;
  String? explain;
  Vocabulary({super.id ,this.vocabulary, this.mean,this.example,this.explain});

  @override
  List<Object?> get props => [id, vocabulary, mean];
}