import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:membreadflutter/src/domain/models/user.dart';
import 'package:membreadflutter/src/dtos/getuserinfodto/getuserinfodto.dart';

class UserRepository {
  Future<User> getUser (String userId) async
  {
    Response response = await get(Uri.parse("http://localhost:3000/user/all-info"));
    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      print(result);
      final getUserInfoDTO =  GetUserInfoDTO.fromJson(result);
      return User(id: userId,username: "${getUserInfoDTO.firstName} ${getUserInfoDTO.lastName}" , avatar: getUserInfoDTO.avatar);
    }else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});