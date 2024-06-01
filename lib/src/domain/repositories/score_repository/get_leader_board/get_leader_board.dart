
import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:membreadflutter/src/dtos/leaderboarddto/userscore_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_leader_board.g.dart';

class GetLeaderBoardParams {
  int courseId;
  String period;
  GetLeaderBoardParams(this.courseId,this.period);
}

@riverpod
Future<List<UserScoreDTO>> getLeaderBoard(ref,GetLeaderBoardParams params) async{
  final dio = ref.read(dioProvider);
  Response response = await dio.get('achievement/leader-board',
      queryParameters : {
        "course_id" : params.courseId,
        "period" : params.period
      });

  if(response.statusCode == 200){
    final leaderBoardRaw = response.data as List;
    final leaderBoard = leaderBoardRaw.map((userScore) {
      print("USER SCORE : $userScore");
      return UserScoreDTO.fromJson(userScore);
    }).toList();

    print("USERNAME : ${leaderBoard[0].userInfo!.firstName??""}");

    return leaderBoard;
  }else{
    throw Exception(response.statusMessage);
  }
}