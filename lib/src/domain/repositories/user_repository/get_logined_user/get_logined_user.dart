import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:membreadflutter/src/database/local/core/share_preferences.dart';
import 'package:membreadflutter/src/database/local/user/logined_user.dart';
import 'package:membreadflutter/src/domain/notifiers/user_notifier/user_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/user.dart';

part 'get_logined_user.g.dart';

@riverpod
Future<User> getLoginedUser(GetLoginedUserRef ref) async {
  final loginedUser = ref.read(loginedUserProvider);

  User user = loginedUser.getUser();
  if (user.id == null || user.id == '') {
    print("Loi o day nay");
    final dio = await ref.read(dioProviderWithAccessToken.future);
    // Gửi request với options
    final response = await dio.get('user/logined');
    if (response.statusCode == 200) {
      final result = response.data;
      final newUser =  User(
          id: result['id'],
          email: result['email'],
          username: result['firstName'] + " " + result["lastName"],
          avatar: result["avatar"]);

      await loginedUser.setId(newUser.id??'');
      await loginedUser.setAvatar(newUser.avatar??'');
      await loginedUser.setUsername(newUser.username??'');

      return newUser;
    } else {
      throw UnauthorizedException();
    }
  }

  return user;
}
