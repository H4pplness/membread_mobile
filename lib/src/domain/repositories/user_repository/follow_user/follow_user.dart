
import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'follow_user.g.dart';

@riverpod
Future<void> followUser(ref,String? userId) async{
  if(userId == null) throw Exception();
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response = await dio.post('follow?following=$userId');
  if(response.statusCode == 201)return;
  else{
    throw Exception();
  }
}