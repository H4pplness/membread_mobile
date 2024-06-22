import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/network.dart';
import '../../../dtos/leaderboarddto/userscore_dto.dart';
import '../../atoms/images/circle_image.dart';

class LeaderBoardTop3 extends StatelessWidget {
  List<UserScoreDTO>? leaderBoard;
  LeaderBoardTop3({super.key, this.leaderBoard});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 40,
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.crown,
                    size: 30,
                    color: Colors.yellow,
                  ),
                  CircleImage(
                    borderWidth: 2.0,
                    borderColor: Colors.yellow,
                    image: leaderBoard![0].userInfo!.avatar != null
                        ? DecorationImage(
                            image: NetworkImage(
                                avatar(leaderBoard![0].userInfo!.avatar) ?? ""))
                        : const DecorationImage(
                            image: AssetImage("assets/membread.jpg")),
                    diameter: 90,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                leaderBoard![0].userInfo!.userName!,
                style: Theme.of(context).textTheme.displayMedium,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                leaderBoard![0].score.toString(),
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
        ));
  }
}
