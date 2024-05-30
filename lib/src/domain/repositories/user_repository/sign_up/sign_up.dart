import 'dart:core';

import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:membreadflutter/src/dtos/signupdto/sign_up_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up.g.dart';

@riverpod
Future<dynamic> signUp (ref,SignUpDTO signup) async {
  final dio = ref.read(dioProvider);
  try {
    Response response = await dio.post('/auth/sign-up', data: signup.toJson());
    print("DATA SENT: ${signup.toJson()}");
    print("RESPONSE: ${response.data}");

    if (response.statusCode == 201) {
      print("SIGN UP SUCCESS");
      return null;
    } else {
      print(response.data);
      return response.data['message'];
    }
  } on DioException catch (e) {
    if (e.response != null) {
      // The server responded with an error
      print("Error Response: ${e.response!.data}");
      return e.response!.data['message'] ?? 'Unknown error occurred';
    } else {
      // Something else happened
      print("Dio Error: ${e.message}");
      return 'Network error occurred';
    }
  } catch (e) {
    // Handle any other types of errors
    print("Unexpected Error: $e");
    return 'An unexpected error occurred';
  }

}