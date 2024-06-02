
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'join_course.g.dart';
@riverpod
Future<void> joinCourse(ref,int courseId) async {
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response = dio.post('/study/course/join',data : {"courseId" : courseId});
  if(response.statusCode == 200){
    print(response.data);
    return;
  }else{
    throw Exception(response.statusMessage);
  }
}