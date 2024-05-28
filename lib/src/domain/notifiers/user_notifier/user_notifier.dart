
import 'package:membreadflutter/src/domain/models/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_notifier.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier
{
  @override
  User build() {
    print("REBUILDREBUILDREBUILDREBUILDREBUILDREBUILDREBUILDREBUILD");
    return User();
  }

  void setId(String id){
    state = User(id: id,username: state.username,email: state.email,phone: state.phone,avatar: state.avatar);
  }

  void setUsername(String username)
  {
    state = User(id: state.id,username: username,email: state.email,phone: state.phone,avatar: state.avatar);
  }

  void setEmail(String email){
    state = User(id: state.id,username: state.username,email: email,phone: state.phone,avatar: state.avatar);
  }

}


