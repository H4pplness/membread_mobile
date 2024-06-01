import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/database/local/token/token.dart';
import 'package:membreadflutter/src/database/local/user/logined_user.dart';
import 'package:membreadflutter/src/screens/learning_setting_screen/learning_setting_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/models/user.dart';
import '../../../widgets/atoms/cards/setting_card.dart';
import '../../achievement_screen/achievement_screen.dart';
import '../../help_center_screen/help_center_screen.dart';
import '../../notification_screen/notification_screen.dart';
import '../../profile_screen/profile_screen.dart';
import '../../welcome_screen/welcome_screen.dart';

class SettingTab extends ConsumerWidget {
  const SettingTab({super.key});

  Future<void> clearSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final loginedUser = ref.watch(loginedUserProvider);

    User user = loginedUser.getUser();

    return Container(
      padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 30),
      child: Column(
        children: [
          SettingCard(
            icon: Icons.person,
            content: "Profile",
            onTap: ()=>Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileScreen(user: user))),
          ),
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
            icon: Icons.calendar_month_sharp,
            content: "Learning Settings",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LearningSettingScreen()));
            }
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
            onTap: () async {
              await clearSharedPreferences();
              Navigator.push(context,MaterialPageRoute(builder: (context) => WelcomeScreen()));
              final token = ref.read(tokenProvider);
              print("ACCESS TOKEN : ${token.getRefreshToken()}");
            },
          )
        ],
      ),
    );
  }
}
