
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'explore_tab_notifier.g.dart';
@riverpod
class ExploreTabNotifier extends _$ExploreTabNotifier {
  @override
  int build(){
    return 0;
  }

  void setIndex(int index){
    state = index;
  }
}