import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_total_score.g.dart';

@riverpod
Future<int> getTotalScore(ref) async{
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response = await dio.get('/achievement/total-score');
  if(response.statusCode == 200){
    return response.data['totalScore'] as int;
  }else{
    throw Exception(response.statusMessage);
  }

}