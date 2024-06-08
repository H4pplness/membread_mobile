

import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/honor.dart';
import '../../../models/user.dart';

part 'get_user_info.g.dart';

@riverpod
Future<User> getUserInfo(ref,String? userId) async{
  if(userId == null){
    throw Exception();
  }

  final dio = ref.read(dioProvider);
  Response response = await dio.get('user/info?user_id=$userId');

  if(response.statusCode == 200){
    final result = response.data;
    final honors = result['honors'] as List;
    final listHonor = honors.map((honor) => HonorExtension.fromString(honor['honor'])).toList();

    return User(
      id: result['id'],
      username: result['userName'],
      firstname: result['firstName'],
      lastname: result['lastName'],
      avatar: avatar(result['avatar']),
      totalScore: int.parse(result['totalScore']??"0"),
      numberOfFollowers: result['numberOfFollowers'],
      numberOfFollowings: result['numberOfFollowings'],
      honors: listHonor??[]
    );

  }else{
    throw Exception(response.statusMessage);
  }
}