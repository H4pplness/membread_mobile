import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/get_course_info.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/index.dart';
import 'package:membreadflutter/src/screens/new_home_screen/notifier/tab_index_notifier.dart';
import 'package:membreadflutter/src/screens/new_home_screen/tabs/home_tab.dart';
import 'package:membreadflutter/src/screens/new_home_screen/tabs/setting_tab.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/new_home_page_appbar.dart';
import '../../domain/models/user.dart';
import '../../widgets/organisms/app_bars/title_appbar.dart';

User user = User(
    id: "c2dfc725-f108-4271-bfc4-765b7914044a",
    username: "Membread",
    avatar:
        "https://ssl.gstatic.com/onebox/media/sports/logos/udQ6ns69PctCv143h-GeYw_96x96.png");

class NewHomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    print("REBUILD ...");
    final courseParams = GetCourseInfoParams(courseId: 1,userId: "b4d8a4d1-ed79-4905-a3d5-fc7b98799037");
    final course = ref.watch(courseRepository.getCourseInfo);
    
    // ref.listen(courseRepository.getCourseInfo(courseParams),
    //         (previous, next) { }
    // );
    
    final List<PreferredSizeWidget?> appBars = [
      NewHomePageAppBar(user: user),
      TitleAppbar(
        title: Text("OKE"),
      ),
      null
    ];

    final List<Widget> contents = [
      Home(),
      Container(),
      Setting()
    ];

    final index = ref.watch(tabIndexNotifierProvider);

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: appBars[index],
        body: contents[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (index) =>
              ref.read(tabIndexNotifierProvider.notifier).setIndex(index),
          backgroundColor: Theme.of(context).colorScheme.background,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).iconTheme.color,
          selectedFontSize: 12,
          selectedIconTheme: const IconThemeData(size: 27, opticalSize: 1),
          unselectedIconTheme: const IconThemeData(opticalSize: 1, size: 27),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.school,
                ),
                label: "Course"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: "Setting"),
          ],
        ));
  }
}
