
import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_goal.g.dart';

@riverpod
Future<int> getGoal(ref) async {
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response = dio.get('achievement/goal');

  if(response.statusCode == 200){
    return response.data['goal'];
  }else{
    throw new Exception(response.statusMessage);
  }
}