import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/domain/models/user.dart';
import 'package:membreadflutter/src/domain/notifiers/user_notifier/user_notifier.dart';
import 'package:membreadflutter/src/domain/repositories/score_repository/get_daily_score/get_daily_score.dart';
import 'package:membreadflutter/src/domain/repositories/user_repository/get_logined_user/get_logined_user.dart';
import 'package:membreadflutter/src/screens/new_home_screen/new_home_screen.dart';
import 'package:membreadflutter/src/screens/profile_screen/profile_screen.dart';
import 'package:membreadflutter/src/widgets/atoms/sliders/progress_slider.dart';

class NewHomePageAppBar extends ConsumerWidget implements PreferredSizeWidget {
  NewHomePageAppBar({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final user = ref.watch(getLoginedUserProvider);
    final dailyScore = ref.watch(getDailyScoreProvider);

    return user.when(data: (user){
      return Stack(
        clipBehavior: Clip.none,
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).primaryColor,
            title: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Hi, ${user.username} !",
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    overflow: TextOverflow.clip,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Let's start learning",
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                          user: user,
                        ))),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    image: user.avatar != null
                        ? DecorationImage(
                      image: NetworkImage(user.avatar ?? ""),
                      fit: BoxFit.cover,
                    )
                        : const DecorationImage(
                      image: AssetImage('assets/membread.jpg'),
                      fit: BoxFit.cover,
                    ),
                    border: const Border(
                      bottom: BorderSide(color: Colors.grey),
                      top: BorderSide(color: Colors.grey),
                      left: BorderSide(color: Colors.grey),
                      right: BorderSide(color: Colors.grey),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: -60,
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                            Colors.black.withOpacity(0.2), // Màu của bóng đổ
                            spreadRadius: 3, // Bán kính bóng đổ
                            blurRadius: 7, // Độ mờ của bóng đổ
                            offset: Offset(0, 3), // Độ lệch của bóng đổ
                          ),
                        ],
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Today's score",
                              style: GoogleFonts.montserrat(
                                fontSize : 17,
                                color : Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                                fontWeight : FontWeight.w500
                              )),
                          const SizedBox(height: 5),
                          dailyScore.when(data: (data){
                            return Text(data.dailyScore.toString(),style: Theme.of(context).textTheme.titleMedium);
                          }, error: (error,__){
                            print("ERROR : $error");
                            return Text("0",style: Theme.of(context).textTheme.titleMedium);
                          }, loading: (){
                            return Text("",style: Theme.of(context).textTheme.titleMedium);
                          }),
                          const SizedBox(height: 5),
                          dailyScore.when(data: (data){
                            final progress = (data.dailyScore/data.goal >= 1) ? 1.0 : data.dailyScore/data.goal;
                            return ProgressSlider(
                                contentColor: Colors.blue[200],
                                progress: progress,
                                height: 8,
                                width: MediaQuery.of(context).size.width * 0.7);
                          }, error: (_,__){
                            return ProgressSlider(
                                contentColor:
                                MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                    ? Colors.white
                                    : Colors.black12,
                                progress: 0,
                                height: 8,
                                width: MediaQuery.of(context).size.width * 0.7);
                          }, loading: (){
                            return ProgressSlider(
                                contentColor:
                                MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                    ? Colors.white
                                    : Colors.black12,
                                progress: 0,
                                height: 8,
                                width: MediaQuery.of(context).size.width * 0.7);
                          })
                        ],
                      ),
                    )),
              ))
        ],
      );
    }, error: (_,__){
      return Container();
    }, loading: (){
      return Container();
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(110.0);
}
