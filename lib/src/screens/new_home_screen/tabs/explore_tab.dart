import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/database/local/user/logined_user.dart';
import 'package:membreadflutter/src/domain/repositories/user_repository/get_followings/get_followings.dart';
import 'package:membreadflutter/src/domain/repositories/user_repository/get_popular_user/get_popular_user.dart';
import 'package:membreadflutter/src/screens/new_home_screen/notifier/explore_tab/explore_tab_notifier.dart';
import 'package:membreadflutter/src/screens/profile_screen/profile_screen.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/user_card.dart';
import 'package:membreadflutter/src/widgets/molecules/textfield/search_field.dart';
import '../../../domain/models/user.dart';
import '../../../widgets/atoms/buttons/color_button.dart';

class ExploreTab extends ConsumerWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final loginedUserId = ref.watch(loginedUserProvider).getId();
    final exploreTab = ref.watch(exploreTabNotifierProvider);
    final followings = ref.watch(getFollowingsProvider(loginedUserId!));
    final popular = ref.watch(getPopularUserProvider);
    AsyncValue<List<User>> users;

    if (exploreTab == 0) {
      users = popular;
    } else if (exploreTab == 1) {
      users = followings;
    } else {
      users = followings;
    }

    return Container(
      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Column(
        children: [
          SearchField(),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              ColorButton(
                  color:
                      exploreTab == 0 ? Theme.of(context).primaryColor : null,
                  onPressed: () {
                    ref.read(exploreTabNotifierProvider.notifier).setIndex(0);
                  },
                  child: Text("Popular",
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color:
                              exploreTab == 0 ? Colors.white : Colors.black))),
              ColorButton(
                  color:
                      exploreTab == 1 ? Theme.of(context).primaryColor : null,
                  onPressed: () {
                    ref.read(exploreTabNotifierProvider.notifier).setIndex(1);
                  },
                  child: Text("Following",
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color:
                              exploreTab == 1 ? Colors.white : Colors.black))),
              ColorButton(
                  color:
                      exploreTab == 2 ? Theme.of(context).primaryColor : null,
                  onPressed: () {
                    ref.read(exploreTabNotifierProvider.notifier).setIndex(2);
                  },
                  child: Text("Recommend",
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color:
                              exploreTab == 2 ? Colors.white : Colors.black))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          users.when(
              data: (users) {
                return Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: users.map((user) {
                      return UserCard(
                        user: user,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>ProfileScreen(user: user,))),
                      );
                    }).toList(),
                  ),
                ));
              },
              error: (_, __) {
                return Container();
              },
              loading: () => Center(
                    child: CircularProgressIndicator(),
                  ))
        ],
      ),
    );
  }
}
