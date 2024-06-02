import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

import '../database/local/token/token.dart';

final dioProvider = Provider<Dio>((ref) {
  final baseUrl = dotenv.env['API'];
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl??'http://10.0.2.2:3000/',
      connectTimeout: Duration(seconds: 100000),
      receiveTimeout: Duration(seconds: 2),
    ),
  );

  // Cấu hình Dio nếu cần, như thêm Interceptors
  dio.interceptors.add(LogInterceptor(responseBody: true));

  return dio;
});

final dioProviderWithAccessToken = FutureProvider<Dio>((ref) async {
  final tokenManager = ref.read(tokenProvider);

  final accessToken = await tokenManager.getAccessToken();
  if (accessToken != null) {
    // Tạo một map chứa các header, bao gồm access token
    final Map<String, dynamic> headers = {
      'Authorization': 'Bearer $accessToken',
      // Thêm các header khác nếu cần
    };
    final baseUrl = dotenv.env['API'];
    final dio = Dio(
      BaseOptions(
          baseUrl: baseUrl??'http://10.0.2.2:3000/',
          connectTimeout: Duration(seconds: 10000),
          receiveTimeout: Duration(seconds: 2),
          headers: headers),
    );

    // Cấu hình Dio nếu cần, như thêm Interceptors
    dio.interceptors.add(LogInterceptor(responseBody: true));

    return dio;
  } else {
    throw UnauthorizedException();
  }
});

String? avatar(String? avatarPath){
  final baseUrl = dotenv.env['API'];
  if(avatarPath==null)return null;
  return baseUrl!+avatarPath;
}
