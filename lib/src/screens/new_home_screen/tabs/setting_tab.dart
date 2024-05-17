import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../domain/models/user.dart';
import '../../../widgets/atoms/cards/setting_card.dart';
import '../../achievement_screen/achievement_screen.dart';
import '../../help_center_screen/help_center_screen.dart';
import '../../notification_screen/notification_screen.dart';
import '../../profile_screen/profile_screen.dart';
import '../../welcome_screen/welcome_screen.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20,top: 40,bottom: 30),
      child: Column(
        children: [
          SettingCard(
            icon: Icons.person,
            content: "Profile",
            onTap: ()=>Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileScreen(user: User()))),
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
          // const SizedBox(
          //   height: 10,
          // ),
          // SettingCard(
          //   icon: Icons.light_mode,
          //   content: "Screen mode",
          //   haveToggleButton: true,
          // ),
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
    );
  }
}
