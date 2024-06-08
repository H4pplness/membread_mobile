import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/user.dart';

part 'get_followings.g.dart';

@riverpod
Future<List<User>> getFollowings(ref, String userId) async {
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response = await dio.get('/follow/followings?follower=$userId');
  if (response.statusCode == 200) {
    final result = response.data as List;
    List<User> followings = result.map((data) {
      return User(
          id: data['following'],
          username: data['username'],
          firstname: data['firstname'],
          lastname: data['lastname'],
          avatar: avatar(data['avatar']));
    }).toList();
    return followings;
  } else {
    throw Exception();
  }
}
