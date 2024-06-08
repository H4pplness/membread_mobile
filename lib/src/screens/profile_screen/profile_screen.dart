import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/database/local/user/logined_user.dart';
import 'package:membreadflutter/src/domain/models/honor.dart';
import 'package:membreadflutter/src/domain/models/user.dart';
import 'package:membreadflutter/src/domain/repositories/user_repository/follow_user/follow_user.dart';
import 'package:membreadflutter/src/domain/repositories/user_repository/get_user_info/get_user_info.dart';
import 'package:membreadflutter/src/screens/personal_edit_screen/personal_edit_screen.dart';
import 'package:membreadflutter/src/screens/profile_screen/notifiers/follow_notifier/follow_notifier.dart';
import 'package:membreadflutter/src/screens/profile_screen/notifiers/list_course_tab/list_course_tab_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/text_only_button.dart';
import 'package:membreadflutter/src/widgets/atoms/images/profile_avatar.dart';
import '../../domain/repositories/user_repository/check_follow/check_follow.dart';
import '../../widgets/organisms/app_bars/close_title_appbar.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  User? user;
  ProfileScreen({super.key, this.user});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool _isFirsttime = true;

  @override
  Future<void> didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (_isFirsttime) {
      final isFollow =
          await ref.watch(checkFollowProvider(widget.user!.id).future);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(followNotifierProvider.notifier).setFollow(isFollow);
        setState(() {
          _isFirsttime = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final listCourseTab = ref.watch(listCourseTabNotifierProvider);
    final loginedUser = ref.watch(loginedUserProvider);
    final userLoginedId = loginedUser.getId();
    final isOwner = userLoginedId == widget.user!.id;
    final currentUser = ref.watch(getUserInfoProvider(widget.user!.id));
    final isFollow = ref.watch(followNotifierProvider);

    return Scaffold(
      appBar: CloseTitleAppbar(
        onLeadingButtonPressed: () => Navigator.pop(context),
        actions: [
          isOwner
              ? IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonalEditScreen()));
                  },
                  icon: const Icon(Icons.edit))
              : IconButton(
                  onPressed: () async {
                    await ref.read(followUserProvider(widget.user!.id));
                    ref.read(followNotifierProvider.notifier).setFollow(!isFollow);
                  },
                  icon: isFollow
                      ? Icon(Icons.track_changes,
                          color: Theme.of(context).primaryColor)
                      : Icon(Icons.track_changes, color: Colors.grey))
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: currentUser.when(data: (user) {
        final fullname = "${user.firstname!} ${user.lastname!}";
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: ProfileAvatar(
                  avatarUrl: user.avatar,
                  isOwner: isOwner,
                )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  user.username ?? "",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  fullname,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(
                  height: 10,
                ),
                if (user.honors!.isNotEmpty)
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: user.honors!.map((honor) {
                      return CircleAvatar(
                        backgroundImage: AssetImage(honor.image),
                        radius: 20,
                      );
                    }).toList(),
                  ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 1,
                  child: Container(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width / 3 - 20,
                      child: Column(
                        children: [
                          Text(
                            user.numberOfFollowers.toString(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 5,
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
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width / 3 - 20,
                      child: Column(
                        children: [
                          Text(
                            user.numberOfFollowings.toString(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Followings",
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
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width / 3 - 20,
                      child: Column(
                        children: [
                          Text(
                            user.totalScore.toString(),
                            // totalScore.when(data: (data){return data.toString();}, error: (error,_){return "";}, loading:(){ return "";}),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Total score",
                            style: Theme.of(context).textTheme.displaySmall,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextOnlyButton(
                      label: "Learning",
                      color: listCourseTab == 0
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                      onPressed: () {
                        ref
                            .read(listCourseTabNotifierProvider.notifier)
                            .setIndex(0);
                      },
                      hasUnderline: listCourseTab == 0,
                    ),
                    TextOnlyButton(
                        label: "Teaching",
                        color: listCourseTab == 1
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                        onPressed: () {
                          ref
                              .read(listCourseTabNotifierProvider.notifier)
                              .setIndex(1);
                        },
                        hasUnderline: listCourseTab == 1)
                  ],
                )
              ],
            ),
          ),
        );
      }, error: (error, _) {
        return Container();
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
