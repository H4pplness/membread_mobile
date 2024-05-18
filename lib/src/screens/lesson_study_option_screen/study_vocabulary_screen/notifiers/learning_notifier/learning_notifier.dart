
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'learning_notifier.g.dart';

@riverpod
class LearningNotifier extends _$LearningNotifier{
  @override
  int build() {
    return 0;
  }

  void increase(){
    state = state+1;
  }
}