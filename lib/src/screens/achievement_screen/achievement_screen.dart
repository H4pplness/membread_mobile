import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/achievement_card.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/title_appbar.dart';

class AchievementScreen extends ConsumerWidget {
  const AchievementScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {


    return Scaffold(
        appBar: TitleAppbar(title: Text('Achievement',
          style: Theme.of(context).textTheme.titleMedium,
          overflow: TextOverflow.ellipsis,),
          leadingButtonOnPressed:() => Navigator.pop(context),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AchievementCard(achievementImage: AssetImage('assets/newbie_achievement.jpg'),
                  title: "Newbie",
                  description: "Get 100000xp in this month to get achievement",
                  progress: 1,
                  isReceived: true,
                ),
                AchievementCard(achievementImage: AssetImage('assets/jambonbeurre_achievement.jpg'),
                  title: "Great king",
                  description: "Get 5000xp in this month to get achievement",
                ),
                AchievementCard(achievementImage: AssetImage('assets/sandwich_achievement.jpg'),
                  title: "Great king",
                  description: "Get 5000xp in this month to get achievement",
                ),
                AchievementCard(achievementImage: AssetImage('assets/baguette_achievement.jpg'),
                  title: "Great king",
                  description: "Get 5000xp in this month to get achievement",
                ),
                AchievementCard(achievementImage: AssetImage('assets/rocket_achievement.jpg'),
                  title: "Great king",
                  description: "Get 5000xp in this month to get achievement",
                ),
                AchievementCard(achievementImage: AssetImage('assets/cheese_achievement.jpg'),
                  title: "Great king",
                  description: "Get 5000xp in this month to get achievement",
                ),
                AchievementCard(achievementImage: AssetImage('assets/star_achievement.jpg'),
                  title: "Great king",
                  description: "Get 5000xp in this month to get achievement",
                ),
                AchievementCard(achievementImage: AssetImage('assets/hourlass_achievement.jpg'),
                  title: "Great king",
                  description: "Get 5000xp in this month to get achievement",
                ),
              ],
            ),
          ),
        )
    );
  }
}
