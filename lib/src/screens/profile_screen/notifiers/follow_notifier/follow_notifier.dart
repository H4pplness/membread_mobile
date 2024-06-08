
import 'package:membreadflutter/src/domain/repositories/user_repository/check_follow/check_follow.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'follow_notifier.g.dart';

@riverpod
class FollowNotifier extends _$FollowNotifier{
  @override
  bool build(){
    return false;
  }

  void setFollow(bool isFollow){
    state = isFollow;
  }
}