
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network.dart';

part 'update_course_background.g.dart';

class UpdateCourseBackgroundParams {
  XFile ? file;
  int? courseId;

  UpdateCourseBackgroundParams(this.file,this.courseId);
}

@riverpod
Future<String?> updateCourseBackground(ref, UpdateCourseBackgroundParams params) async {
  if (params.file == null || params.courseId == null) {
    return "Something wrong !";
  } else {
    final dio = await ref.read(dioProviderWithAccessToken.future);
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(params.file!.path, filename: params.file!.name),
    });

    try {
      Response response = await dio.post('study/course/avatar?course_id=${params.courseId}', data: formData);
      print('Upload response: ${response.data}');
      if(response.statusCode == 201){
        return response.data['path'];
      }else{
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
  return null;
}