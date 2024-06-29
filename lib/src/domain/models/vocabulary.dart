import 'package:membreadflutter/src/domain/models/learning.dart';

class Vocabulary extends Learning{
  String? vocabulary;
  String? mean;
  List<String>? example;
  String? explain;
  int progress;
  int studiedLevel;
  DateTime? lastUpdated;
  bool needToReview;
  Vocabulary({super.id ,this.vocabulary, this.mean,this.example,this.explain,this.progress = 0,this.studiedLevel = 0,this.lastUpdated,this.needToReview = false});

  @override
  List<Object?> get props => [id];

  Vocabulary copyWith({
    String? vocabulary,
    String? mean,
    List<String>? example,
    String? explain,
    int? progress,
    int? studiedLevel,
    DateTime? lastUpdated,
    bool? needToReview
  }){
    return Vocabulary(
      vocabulary: vocabulary??this.vocabulary,
      mean: mean??this.mean,
      example: example??this.example,
      explain: explain??this.explain,
      progress: progress??this.progress,
      studiedLevel: studiedLevel??this.studiedLevel,
      lastUpdated: lastUpdated??this.lastUpdated,
      needToReview: needToReview??this.needToReview
    );
  }
}