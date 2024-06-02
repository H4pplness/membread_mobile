import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:membreadflutter/src/database/local/user/logined_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upload_avatar.g.dart';

@riverpod
Future<String?> uploadAvatar(UploadAvatarRef ref, XFile? file) async {
  if (file == null) {
    return "Something wrong !";
  } else {
    final dio = await ref.read(dioProviderWithAccessToken.future);
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path, filename: file.name),
    });

    try {
      Response response = await dio.post('upload/avatar', data: formData);
      print('Upload response: ${response.data}');
      if(response.statusCode == 201){
        await ref.read(loginedUserProvider).setAvatar(dotenv.env['API']! + response.data['image']);
        return "Upload file success !";
      }else{
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
}
