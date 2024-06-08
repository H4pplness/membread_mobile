import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/user.dart';

part 'get_popular_user.g.dart';

@riverpod
Future<List<User>> getPopularUser(ref) async {
  final dio = ref.read(dioProvider);
  Response response = await dio.get('follow/popular');
  if (response.statusCode == 200) {
    final result = response.data as List;
    return result
        .map((rawuser) => User(
            id: rawuser['id'],
            username: rawuser['user_name'],
            firstname: rawuser['first_name'],
            lastname: rawuser['last_name'],
            avatar: avatar(rawuser['avatar'])))
        .toList();
  } else {
    throw Exception();
  }
}
