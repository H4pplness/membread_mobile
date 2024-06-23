import 'package:flutter_riverpod/flutter_riverpod.dart';

class MultiChoiceState {
  bool? isTrue;
  int choice;

  MultiChoiceState({this.isTrue, this.choice = -1});
}

/**
 * Sử dụng để kiểm tra chọn multichoice chưa
 */
class SpeedTestResultNotifier extends StateNotifier<MultiChoiceState> {
  final Ref ref;

  SpeedTestResultNotifier(this.ref) : super(MultiChoiceState());

  chooceAnswer(int index, bool isTrue) {
    state = MultiChoiceState(isTrue: isTrue, choice: index);
  }

  resetState() {
    state = MultiChoiceState();
  }
}

final speedTestResultNotifierProvider =
    StateNotifierProvider<SpeedTestResultNotifier, MultiChoiceState>(
        (ref) => SpeedTestResultNotifier(ref));
