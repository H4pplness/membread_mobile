import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/domain/models/user.dart';
import 'package:membreadflutter/src/domain/notifiers/user_notifier/user_notifier.dart';
import 'package:membreadflutter/src/screens/personal_edit_screen/personal_edit_screen.dart';
import 'package:membreadflutter/src/screens/profile_screen/notifiers/list_course_tab/list_course_tab_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/text_only_button.dart';
import 'package:membreadflutter/src/widgets/atoms/images/profile_avatar.dart';
import '../../widgets/organisms/app_bars/close_title_appbar.dart';

class ProfileScreen extends ConsumerWidget {
  User? user;
  ProfileScreen({super.key, this.user});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final listCourseTab = ref.watch(listCourseTabNotifierProvider);

    return Scaffold(
      appBar: CloseTitleAppbar(
        onLeadingButtonPressed: () => Navigator.pop(context),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PersonalEditScreen()));
              },
              icon: const Icon(Icons.edit))
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ProfileAvatar(avatarUrl: user?.avatar,)
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              user!.username??"",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 1,
              child: Container(
                color: Theme.of(context).dividerColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3 - 20,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Text(
                        "1000",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Follower",
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 1,
                  height: 50,
                  child: Container(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3 - 20,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Text(
                        "1000",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Following",
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 1,
                  height: 50,
                  child: Container(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3 - 20,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Text(
                        "1000",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Lifetime XP",
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     PrimaryTextButton(
            //       text: "Follow",
            //       width: MediaQuery.of(context).size.width / 2 - 50,
            //     ),
            //     PrimaryTextButton(
            //       text: "Message",
            //       width: MediaQuery.of(context).size.width / 2 - 50,
            //     )
            //   ],
            // ),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextOnlyButton(
                  label: "Learning",
                  color: listCourseTab == 0 ? Theme.of(context).primaryColor : Colors.black,
                  onPressed: (){
                    ref.read(listCourseTabNotifierProvider.notifier).setIndex(0);
                  },
                  hasUnderline: listCourseTab == 0,),
                TextOnlyButton(
                  label: "Teaching",
                  color: listCourseTab == 1 ? Theme.of(context).primaryColor : Colors.black,
                  onPressed: (){
                    ref.read(listCourseTabNotifierProvider.notifier).setIndex(1);
                  },
                  hasUnderline: listCourseTab == 1)
              ],
            )
          ],
        ),
      ),
    );
  }
}
