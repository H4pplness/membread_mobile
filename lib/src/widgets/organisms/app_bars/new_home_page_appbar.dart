import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/domain/models/user.dart';
import 'package:membreadflutter/src/screens/new_home_screen/new_home_screen.dart';
import 'package:membreadflutter/src/screens/profile_screen/profile_screen.dart';
import 'package:membreadflutter/src/widgets/atoms/sliders/progress_slider.dart';

class NewHomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  User user;
  NewHomePageAppBar({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Hi, ${user.username} !",
                  style: GoogleFonts.notoSans(
                      fontSize: 20, fontWeight: FontWeight.w600,color : Colors.white),
                  overflow: TextOverflow.clip,
                ),
                const SizedBox(height: 5),
                Text(
                  "Let's start learning",
                  style: GoogleFonts.notoSans(
                      fontSize: 15, fontWeight: FontWeight.w500 , color : Colors.white),
                )
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen(user: user,))),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image: user.avatar != null ? DecorationImage(
                    image: NetworkImage(user.avatar??""),
                    fit: BoxFit.cover,
                  ) : const DecorationImage(
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
                          color: Colors.black.withOpacity(0.2), // Màu của bóng đổ
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
                            style: Theme.of(context).textTheme.displaySmall),
                        const SizedBox(height: 5),
                        Text("10000/20000",
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 5),
                        ProgressSlider(
                            contentColor: MediaQuery.of(context).platformBrightness==Brightness.dark ? Colors.white : Colors.black12,
                            progress: 0.5,
                            height: 8,
                            width: MediaQuery.of(context).size.width * 0.7)
                      ],
                    ),
                  )),
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110.0);
}
