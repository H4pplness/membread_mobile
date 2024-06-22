
import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:membreadflutter/src/database/local/token/token.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_with_google.g.dart';

@riverpod
Future<bool> loginWithGoogle(ref) async {
  final dio = ref.read(dioProvider);
  Response response = await dio.get(
      'auth/google',
  );
  if(response.statusCode == 200){
    final result = response.data;
    final tokenManager = ref.watch(tokenProvider);

    tokenManager.saveAccessToken(result['accessToken']);
    tokenManager.saveRefreshToken(result['refreshToken']);
    return true;
  }else {
    throw Exception("Error : ${response.statusMessage}");
  }

}