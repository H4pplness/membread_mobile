

import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:membreadflutter/src/database/local/user/logined_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_daily_score.g.dart';
class DailyScore{
  String userId;
  int dailyScore;
  int goal;
  DailyScore(this.userId,this.dailyScore,this.goal);
}

@riverpod
Future<DailyScore> getDailyScore(GetDailyScoreRef ref) async{
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response = await dio.get('/achievement/daily-score');

  if(response.statusCode == 200){
    final result = response.data;
    return DailyScore(result["userId"],result['dailyScore'],result['goal']);
  }else{
    throw Exception(response.statusMessage);
  }

}