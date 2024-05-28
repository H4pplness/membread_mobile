
import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:membreadflutter/src/database/local/token/token.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login.g.dart';

class LoginParams{
  String email;
  String password;

  LoginParams({required this.email,required this.password});
}

@riverpod
Future<bool> login(LoginRef ref,LoginParams loginParams) async {
  final dio = ref.read(dioProvider);
  Response response = await dio.post(
    'auth/sign-in',
    data : {
      'email' : loginParams.email,
      'password' : loginParams.password
    }
  );
  if(response.statusCode == 201){
    final result = response.data;
    final tokenManager = ref.watch(tokenProvider);

    tokenManager.saveAccessToken(result['accessToken']);
    tokenManager.saveRefreshToken(result['refreshToken']);
    return true;
  }else {
    throw Exception("Error : ${response.statusMessage}");
    return false;
  }

}