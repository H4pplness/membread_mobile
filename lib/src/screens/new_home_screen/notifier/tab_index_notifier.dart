

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tab_index_notifier.g.dart';

@riverpod
class TabIndexNotifier extends _$TabIndexNotifier {
  @override
  int build() => 0;

  void setIndex(index){
    state = index;
  }
}