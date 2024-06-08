
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_follow.g.dart';

@riverpod
Future<bool> checkFollow(ref , String? userId) async {
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response =await dio.get('follow/isfollow?following=$userId');
  if(response.statusCode == 200){
    print(response.data);
    final isFollow =bool.parse(response.data) ;
    return isFollow;
  }else{
    throw Exception();
  }

}