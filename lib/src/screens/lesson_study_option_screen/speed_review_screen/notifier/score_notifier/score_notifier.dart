import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpeedReviewScore{
  int totalScore;
  int nextScore;

  SpeedReviewScore({this.totalScore = 0,this.nextScore=200});

  SpeedReviewScore copyWith({
    int? totalScore,
    int? nextScore
  }){
    return SpeedReviewScore(
        totalScore: totalScore??this.totalScore,
        nextScore: nextScore??this.nextScore
    );
  }
}

class ScoreSpeedReviewVocabulary extends StateNotifier<SpeedReviewScore>{
  final Ref ref;
  SpeedReviewScore testScore;

  ScoreSpeedReviewVocabulary(this.ref)
      : testScore = SpeedReviewScore(),
        super(SpeedReviewScore());

  correctAnswer(){
    int totalScore = state.totalScore + state.nextScore;
    state = SpeedReviewScore(totalScore: totalScore,nextScore: state.nextScore);
  }
}

final scoreSpeedReviewVocabularyProvider = StateNotifierProvider<ScoreSpeedReviewVocabulary,SpeedReviewScore>((ref) => ScoreSpeedReviewVocabulary(ref));