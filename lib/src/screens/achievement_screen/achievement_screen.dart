import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/database/local/core/share_preferences.dart';
import 'package:membreadflutter/src/database/local/user/logined_user.dart';
import 'package:membreadflutter/src/domain/models/honor.dart';
import 'package:membreadflutter/src/domain/repositories/honor_repository/achieve-honor/achieve_honor.dart';
import 'package:membreadflutter/src/domain/repositories/honor_repository/get_honor/get_honor.dart';
import 'package:membreadflutter/src/domain/repositories/score_repository/get_total_score/get_total_score.dart';
import 'package:membreadflutter/src/domain/repositories/user_repository/user_repository.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/achievement_card.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/title_appbar.dart';

class AchievementScreen extends ConsumerWidget {
  const AchievementScreen({super.key});

  _buildAchievementComponents(List<HONOR> honors, int totalScore,WidgetRef ref) {
    List<HONOR> defaultHonors = HONOR.values;
    List<Widget> achievementComponents = [];

    for (var honor in defaultHonors) {
      if (honors.contains(honor)) {
        achievementComponents.add(AchievementCard(
          achievementImage: AssetImage('assets/newbie_achievement.jpg'),
          title: honor.value,
          description: honor.description,
          progress: 1,
          isReceived: true,
        ));
      }else{
        double progress = totalScore/honor.score;
        if(progress>=1){
          achievementComponents.add(
              AchievementCard(
                achievementImage: AssetImage('assets/newbie_achievement.jpg'),
                title: honor.value,
                description: honor.description,
                progress: 1,
                isReceived: false,
                receive: () async {
                  print("RECEIVE>>>>");
                  final response = await ref.read(achieveHonorProvider(honor).future);
                  print("RESPONSE : $response");
                },
              )
          );
        }else{
          achievementComponents.add(
              AchievementCard(
                achievementImage: AssetImage('assets/newbie_achievement.jpg'),
                title: honor.value,
                description: honor.description,
                progress: progress,
                isReceived: false,
              )
          );
        }

      }
    }

    return achievementComponents;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalScore = ref.watch(getTotalScoreProvider);
    final userId = ref.watch(loginedUserProvider).getId();

    final achievements = ref.watch(getHonorProvider(userId!));

    return Scaffold(
        appBar: TitleAppbar(
          title: Text(
            'Achievement',
            style: Theme.of(context).textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
          ),
          leadingButtonOnPressed: () => Navigator.pop(context),
        ),
        body: totalScore.when(data: (totalScore) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
                child: achievements.when(
                    data: (honors) {
                      return Column(
                        children: _buildAchievementComponents(honors, totalScore,ref),
                      );
                    },
                    error: (error, _){
                      print("ACHIEVEMENT SCREEN : ERROR : $error");
                      return Center(child: Text("Some thing wrong !?"),);
                    },
                    loading: () {
                      return Center(child: CircularProgressIndicator());
                    })),
          );
        }, error: (error, __) {
          print(error);
          return Container();
        }, loading: () {
          return Center(child: CircularProgressIndicator());
        }));
  }
}
