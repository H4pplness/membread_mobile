
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:membreadflutter/src/database/local/token/token.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_access_token.g.dart';

@riverpod
Future<String> getAccessToken(ref) async {
  final dio = ref.read(dioProvider);

  final tokenManager = ref.read(tokenProvider);
  final refreshToken = tokenManager.getRefreshToken();

  final Map<String, dynamic> headers = {
    'Authorization': 'Bearer $refreshToken',
  };

  print("REFRESH ACCESS TOKEN !");

  Response response = await dio.post('/auth/refresh',options :Options(
    headers : headers
  ));

  if(response.statusCode == 201){
    print("Get access token");
    return response.data['accessToken'];
  }else{
    print(response.statusMessage);
    throw UnauthorizedException();
  }
}