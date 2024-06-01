import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/screens/learning_setting_screen/daily_goal/daily_goal_group.dart';
import 'package:membreadflutter/src/screens/learning_setting_screen/learning_option_collapse_box/vocabulary_collapse_box/vocabulary_collapse_box.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/title_appbar.dart';
import 'learning_option_collapse_box/grammar_collapse_box.dart';


class LearningSettingScreen extends ConsumerWidget {
  const LearningSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: TitleAppbar(
        leadingButtonOnPressed: () => Navigator.pop(context),
        title: Text("Learning Settings",
            style: Theme.of(context).textTheme.titleMedium),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DailyGoalGroup(),
              const SizedBox(height: 10),
              Text(
                "Learning option",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              VocabularyCollapseBox(),
              const SizedBox(height: 10),
              GrammarCollapseBox()
            ],
          ),
        ),
      ),
    );
  }
}
