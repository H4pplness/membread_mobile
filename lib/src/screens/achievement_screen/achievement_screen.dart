import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/achievement_card.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/title_appbar.dart';

class AchievementScreen extends ConsumerStatefulWidget {
  const AchievementScreen({super.key});

  @override
  ConsumerState createState() => _AchievementScreenState();
}

class _AchievementScreenState extends ConsumerState<AchievementScreen> {
  @override
  Widget build(BuildContext context) {
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
              AchievementCard(achievementImage: AssetImage('assets/crown_achievement.jpg'),
                title: "Great king",
                description: "Get 5000xp in this month to get achievement",
              ),
              AchievementCard(achievementImage: AssetImage('assets/brain_achievement.jpg'),
                title: "Great king",
                description: "Get 5000xp in this month to get achievement",
              ),
              AchievementCard(achievementImage: AssetImage('assets/book_achievement.jpg'),
                title: "Great king",
                description: "Get 5000xp in this month to get achievement",
              ),
              AchievementCard(achievementImage: AssetImage('assets/diamond_achievement.jpg'),
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
