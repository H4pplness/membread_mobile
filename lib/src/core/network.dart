import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:3000/',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 2),
    ),
  );

  // Cấu hình Dio nếu cần, như thêm Interceptors
  dio.interceptors.add(LogInterceptor(responseBody: true));

  return dio;
});

final dioStudyProvider =  Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:3000/',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 2),
    ),
  );

  // Cấu hình Dio nếu cần, như thêm Interceptors
  dio.interceptors.add(LogInterceptor(responseBody: true));

  return dio;
});

final dioAchievementProvider =  Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:3001/',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 2),
    ),
  );

  // Cấu hình Dio nếu cần, như thêm Interceptors
  dio.interceptors.add(LogInterceptor(responseBody: true));

  return dio;
});