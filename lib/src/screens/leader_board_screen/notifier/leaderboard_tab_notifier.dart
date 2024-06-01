
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leaderboard_tab_notifier.g.dart';
@riverpod
class LeaderBoardTabNotifier extends _$LeaderBoardTabNotifier {
  @override
  int build(){
    return 0;
  }

  void setIndex(int index){
    state = index;
  }
}