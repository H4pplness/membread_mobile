
import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:membreadflutter/src/dtos/edit_course_dto/edit_course_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_course_info.g.dart';

@riverpod
Future<void> updateCourseInfo(ref,EditCourseDTO editCourse) async {
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response = await dio.put(
    "study/course",
    data : editCourse.toJson()
  );

  if(response.statusCode == 200){
    print(response.statusMessage);
    return;
  }else{
    throw Exception(response.statusMessage);
  }
}