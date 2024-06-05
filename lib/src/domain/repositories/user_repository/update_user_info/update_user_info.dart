import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:membreadflutter/src/database/local/user/logined_user.dart';
import 'package:membreadflutter/src/dtos/updateuserinfodto/updateuserinfodto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_user_info.g.dart';

@riverpod
Future<void> updateUserInfo(UpdateUserInfoRef ref,UpdateUserInfoDTO updateUser) async {
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response = await dio.put('user/update',data : updateUser.toJson());
  if(response.statusCode == 200){
    final loginedUser = ref.watch(loginedUserProvider);
    if(updateUser.userName !=null){
      await loginedUser.setUsername(updateUser.userName!);
    }
    if(updateUser.firstName !=null){
      await loginedUser.setFirstName(updateUser.firstName!);
    }
    if(updateUser.lastName != null){
      await loginedUser.setLastName(updateUser.lastName!);
    }
  }
}