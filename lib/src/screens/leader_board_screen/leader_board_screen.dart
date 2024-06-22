import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/models/course.dart';
import 'package:membreadflutter/src/domain/repositories/score_repository/get_leader_board/get_leader_board.dart';
import 'package:membreadflutter/src/screens/leader_board_screen/notifier/leaderboard_tab_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/text_only_button.dart';
import 'package:membreadflutter/src/widgets/molecules/leader_board_top3/leader_board_top3.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/close_title_appbar.dart';

import '../../core/network.dart';
import '../../dtos/leaderboarddto/userscore_dto.dart';
import '../../widgets/atoms/images/circle_image.dart';

class LeaderBoardScreen extends ConsumerWidget {
  Course course;
  LeaderBoardScreen({super.key, required this.course});

  _buildLeaderBoard(List<UserScoreDTO> listUserScoreDTO, BuildContext context) {
    List<Widget> listComponent = [];
    for (var userInfo in listUserScoreDTO) {
      listComponent.add(Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width - 40,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                      width: 30,
                      child: Text(
                        (listUserScoreDTO.indexOf(userInfo)+1).toString(),
                        style: Theme.of(context).textTheme.titleSmall,
                        overflow: TextOverflow.ellipsis,
                      )),
                  CircleImage(
                    borderWidth: 2.0,
                    borderColor: Colors.yellow,
                    image: userInfo.userInfo!.avatar != null
                        ? DecorationImage(
                            image: NetworkImage(
                                avatar(userInfo.userInfo!.avatar) ?? ""))
                        : const DecorationImage(
                            image: AssetImage("assets/membread.jpg")),
                    diameter: 50,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      userInfo.userInfo!.userName!,
                      style: Theme.of(context).textTheme.displayMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 80,
              child: Text(
                userInfo.score.toString(),
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ));
    }
    return listComponent;
  }

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
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: FutureBuilder(
                    future: leaderBoard,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: MediaQuery.of(context).size.height - 160,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text("Some thing wrong :v"),
                        );
                      } else {
                        final leaderBoard = snapshot.data;
                        if (leaderBoard!.isEmpty) {
                          return Center(
                            child: Text("No one has joined this course yet !",
                                style: Theme.of(context).textTheme.displayMedium),
                          );
                        }
                
                        return Container(
                          width: MediaQuery.of(context).size.width - 40,
                          child: Column(
                            children: [
                              LeaderBoardTop3(
                                leaderBoard: leaderBoard,
                              ),
                              SizedBox(height: 10,),
                              Column(
                                  children: _buildLeaderBoard(leaderBoard, context))
                            ],
                          ),
                        );
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
