
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'result_notifier.g.dart';

class ScoreStatistics{
  int totalScore;
  int nextScore;

  ScoreStatistics({this.totalScore = 0,this.nextScore = 100});
}

@riverpod
class ResultNotifier extends _$ResultNotifier {
  @override
  ScoreStatistics build(){
    return ScoreStatistics();
  }

  void wrongAnswer(){
    state = ScoreStatistics(totalScore: state.totalScore,nextScore: 100);
  }

  void correctAnswer(){
    state = ScoreStatistics(totalScore: (state.totalScore + state.nextScore),nextScore: (state.nextScore+10));
  }


}