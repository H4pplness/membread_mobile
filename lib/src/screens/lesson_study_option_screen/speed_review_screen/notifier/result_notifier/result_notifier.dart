import 'package:membreadflutter/src/screens/lesson_study_option_screen/speed_review_screen/notifier/get_question/get_question_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'result_notifier.g.dart';

const int REMAIN_HEAL = 3;
const int NUMBER_OF_QUESTION = 25;

class SpeedReviewResult {
  int remainHeal;
  int questionIndex;

  SpeedReviewResult({this.remainHeal = 3, this.questionIndex = 0});
}

@riverpod
class ResultNotifier extends _$ResultNotifier {
  @override
  SpeedReviewResult build() {
    return SpeedReviewResult(remainHeal: 3, questionIndex: 0);
  }

  void wrongAnswerOrEnd() {
    print("WRONG OR END");
    state = SpeedReviewResult(
        remainHeal: state.remainHeal - 1,
        questionIndex: state.questionIndex + 1);

    print("STATE : ${state.remainHeal} , ${state.questionIndex}");
  }

  bool nextQuestion() {
    state = SpeedReviewResult(
        remainHeal: state.remainHeal, questionIndex: state.questionIndex + 1);
    return true;
  }

  int isEnd() {
    print("END CHUA : ${ref.watch(getQuestionNotifierProvider.notifier).isEnd()}");
    if (state.remainHeal == 0) return 0; // Thua
    if (state.questionIndex == NUMBER_OF_QUESTION ||
        ref.watch(getQuestionNotifierProvider.notifier).isEnd()) {
      print("VAO DAY ROI !");
      return 1; // Thắng
    }
    return 2; // Chưa kết thúc trò chơi
  }
}
