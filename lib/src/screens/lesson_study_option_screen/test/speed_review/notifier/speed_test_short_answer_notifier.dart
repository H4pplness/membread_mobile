import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpeedTestShortAnswerNotifier extends StateNotifier<bool?> {
  final Ref ref;
  SpeedTestShortAnswerNotifier(this.ref) : super(null);

  completeAnswer(bool isTrue) {
    state = isTrue;
  }

  resetState() {
    state = null;
  }
}

final speedTestShortAnswerNotifierProvider =
    StateNotifierProvider<SpeedTestShortAnswerNotifier, bool?>(
        (ref) => SpeedTestShortAnswerNotifier(ref));
