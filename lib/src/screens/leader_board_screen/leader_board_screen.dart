import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/models/course.dart';
import 'package:membreadflutter/src/domain/repositories/score_repository/get_leader_board/get_leader_board.dart';
import 'package:membreadflutter/src/dtos/leaderboarddto/userscore_dto.dart';
import 'package:membreadflutter/src/screens/leader_board_screen/notifier/leaderboard_tab_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/text_only_button.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/close_title_appbar.dart';

class LeaderBoardScreen extends ConsumerWidget {
  Course course;
  LeaderBoardScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tab = ref.watch(leaderBoardTabNotifierProvider);
    GetLeaderBoardParams params;
    switch (tab) {
      case 0:
        params = GetLeaderBoardParams(course.id ?? 0, 'alltime');
        break;
      case 1:
        params = GetLeaderBoardParams(course.id ?? 0, 'week');
        break;
      case 2:
        params = GetLeaderBoardParams(course.id ?? 0, 'month');
        break;
      default:
        params = GetLeaderBoardParams(course.id ?? 0, 'alltime');
        break;
    }

    final leaderBoard = ref.read(getLeaderBoardProvider(params).future);

    return Scaffold(
      appBar: CloseTitleAppbar(
        onLeadingButtonPressed: () => Navigator.pop(context),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextOnlyButton(
                  label: "Alltime",
                  onPressed: () => ref
                      .read(leaderBoardTabNotifierProvider.notifier)
                      .setIndex(0),
                  hasUnderline: tab == 0,
                  color:
                      tab == 0 ? Theme.of(context).primaryColor : Colors.grey,
                ),
                TextOnlyButton(
                  label: "Week",
                  onPressed: () => ref
                      .read(leaderBoardTabNotifierProvider.notifier)
                      .setIndex(1),
                  hasUnderline: tab == 1,
                  color:
                      tab == 1 ? Theme.of(context).primaryColor : Colors.grey,
                ),
                TextOnlyButton(
                  label: "Month",
                  onPressed: () => ref
                      .read(leaderBoardTabNotifierProvider.notifier)
                      .setIndex(2),
                  hasUnderline: tab == 2,
                  color:
                      tab == 2 ? Theme.of(context).primaryColor : Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 10,),
            FutureBuilder(
                future: leaderBoard,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      height: MediaQuery.of(context).size.height-160,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Some thing wrong :v"),
                    );
                  } else {
                    final leaderBoard = snapshot.data;
                    return Expanded(
                        child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment : MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: Text(
                                        (index+1).toString(),
                                        style:
                                        Theme.of(context).textTheme.labelMedium,
                                      ),
                                      width: 40,
                                    ),
                                    Text(
                                      leaderBoard?[index].userInfo!.firstName ?? "",
                                      style:
                                      Theme.of(context).textTheme.labelMedium,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width : 80,
                                  child: Text(
                                    leaderBoard?[index].score.toString() ?? "",
                                    style:
                                    Theme.of(context).textTheme.labelMedium,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: leaderBoard?.length,
                    ));
                  }
                })
          ],
        ),
      ),
    );
  }
}
