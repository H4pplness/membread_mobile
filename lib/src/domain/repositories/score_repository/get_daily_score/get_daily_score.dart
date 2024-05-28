

import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_daily_score.g.dart';
class DailyScore{
  String userId;
  String dailyScore;

  DailyScore(this.userId,this.dailyScore);
}

@riverpod
Future<DailyScore> getDailyScore(GetDailyScoreRef ref) async{
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response = await dio.get('/achievement/daily-score');

  if(response.statusCode == 200){
    final result = response.data;
    return DailyScore(result['userid'], result['dailyscore']);
  }else{
    throw Exception(response.statusMessage);
  }

}