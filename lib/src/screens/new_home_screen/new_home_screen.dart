import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/screens/new_home_screen/notifier/tab_index/tab_index_notifier.dart';
import 'package:membreadflutter/src/screens/new_home_screen/tabs/course_tab.dart';
import 'package:membreadflutter/src/screens/new_home_screen/tabs/home_tab.dart';
import 'package:membreadflutter/src/screens/new_home_screen/tabs/setting_tab.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/course_app_bar.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/new_home_page_appbar.dart';

class NewHomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final List<PreferredSizeWidget?> appBars = [
      NewHomePageAppBar(),
      CourseAppBar(),
      AppBar(
        title: Text("Settings",style: Theme.of(context).appBarTheme.titleTextStyle,),
        automaticallyImplyLeading: false,
      )
    ];

    final List<Widget> contents = [
      HomeTab(),
      CourseTab(),
      SettingTab()
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
