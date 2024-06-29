
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestScore{
  int totalScore;
  int nextScore;

  TestScore({this.totalScore = 0,this.nextScore=200});

  TestScore copyWith({
    int? totalScore,
    int? nextScore
  }){
    return TestScore(
      totalScore: totalScore??this.totalScore,
      nextScore: nextScore??this.nextScore
    );
  }
}

class ScoreSpeedTest extends StateNotifier<TestScore>{
  final Ref ref;
  TestScore testScore;

  ScoreSpeedTest(this.ref)
      : testScore = TestScore(),
        super(TestScore());

  correctAnswer(){
    int totalScore = state.totalScore + state.nextScore;
    state = TestScore(totalScore: totalScore,nextScore: state.nextScore);
  }

  speedRun(){
    state = TestScore(totalScore: state.totalScore,nextScore: 300);
  }

  normalTest(){
    state = TestScore(totalScore: state.totalScore,nextScore: 200);
  }
}

final scoreSpeedTestProvider = StateNotifierProvider<ScoreSpeedTest,TestScore>((ref) => ScoreSpeedTest(ref));