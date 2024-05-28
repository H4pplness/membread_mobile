import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/models/user.dart';
import 'package:membreadflutter/src/domain/notifiers/user_notifier/user_notifier.dart';
import 'package:membreadflutter/src/screens/achievement_screen/achievement_screen.dart';
import 'package:membreadflutter/src/screens/new_home_screen/new_home_screen.dart';
import 'package:membreadflutter/src/screens/notification_screen/notification_screen.dart';

import '../../widgets/atoms/cards/setting_card.dart';
import '../../widgets/organisms/app_bars/title_appbar.dart';
import '../help_center_screen/help_center_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../welcome_screen/welcome_screen.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User user = ref.watch(userNotifierProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: TitleAppbar(
        leadingButtonOnPressed: () => Navigator.pop(context),
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            SettingCard(
                icon: Icons.person,
                content: "Profile",
                onTap: () {
                  print("USER : ${user.username}");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                                user: user,
                              )));
                }),
            const SizedBox(
              height: 10,
            ),
            SettingCard(
              icon: Icons.breakfast_dining_rounded,
              content: "Achievement",
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AchievementScreen())),
            ),
            const SizedBox(
              height: 10,
            ),
            SettingCard(
              icon: Icons.light_mode,
              content: "Screen mode",
              haveToggleButton: true,
            ),
            const SizedBox(
              height: 10,
            ),
            SettingCard(
              icon: Icons.notifications,
              content: "Notification",
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationScreen())),
            ),
            const SizedBox(
              height: 10,
            ),
            SettingCard(
              icon: Icons.help,
              content: "Help center",
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HelpCenterScreen())),
            ),
            const SizedBox(
              height: 10,
            ),
            SettingCard(
              icon: Icons.info,
              content: "About membread",
            ),
            const SizedBox(
              height: 10,
            ),
            SettingCard(
              icon: Icons.logout,
              content: "Logout",
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen())),
            )
          ],
        ),
      ),
    );
  }
}
