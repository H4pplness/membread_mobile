
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/models/test.dart';

/**
 * Sử dụng để lấy ra câu hỏi tiếp theo
 */

class TestSpeedProgressNotifier extends StateNotifier<List<Test>?>{
  final Ref ref;
  final Random _random = Random();
  TestSpeedProgressNotifier(this.ref):super([]);

  initial(List<Test> list){
    state = list;
  }

  removeQuestion(Test test){
    if (state == null) return;
    print('Before removal: $state');
    final updatedList = List<Test>.from(state!);
    updatedList.remove(test);
    state = updatedList.isNotEmpty ? updatedList : null;
    print('After removal: $state');
  }

  Test? getQuestion() {
    if (state == null || state!.isEmpty) {
      return null;
    }
    final randomIndex = _random.nextInt(state!.length);
    final question = state![randomIndex];
    return question;
  }

}

final testSpeedProgressNotifierProvider = StateNotifierProvider<TestSpeedProgressNotifier,List<Test>?>((ref){
  return TestSpeedProgressNotifier(ref);
});
