import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/models/test.dart';

class SpeedTestResult {
  Test test;
  String correctAnswer;
  String choice;
  bool isTrue;

  SpeedTestResult(
      {required this.test,
      required this.correctAnswer,
      required this.choice,
      required this.isTrue});
}

class ResultSpeedTest extends StateNotifier<List<SpeedTestResult>> {
  final Ref ref;

  ResultSpeedTest(this.ref) : super([]);

  addResult(SpeedTestResult result) {
    state = [...state, result];
  }

  getStatistic() {
    int numberOfCorrectAnswer = 0;
    for (var result in state) {
      if (result.isTrue) {
        numberOfCorrectAnswer++;
      }
    }
    return {"true": numberOfCorrectAnswer, "total": state.length};
  }
}

final resultSpeedTestProvider =
    StateNotifierProvider<ResultSpeedTest, List<SpeedTestResult>>(
        (ref) => ResultSpeedTest(ref));
