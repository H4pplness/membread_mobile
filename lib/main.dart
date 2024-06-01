import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/database/local/core/share_preferences.dart';
import 'package:membreadflutter/src/database/local/token/token.dart';
import 'package:membreadflutter/src/screens/add_lesson_screen/add_leson_screen.dart';
import 'package:membreadflutter/src/screens/new_home_screen/new_home_screen.dart';
import 'package:membreadflutter/src/screens/welcome_screen/welcome_screen.dart';
import 'package:membreadflutter/src/themes/dark_theme.dart';
import 'package:membreadflutter/src/themes/light_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
    child: MyApp(),
  ),);
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context,ref) {
    // Kiểm tra chế độ hiện tại của hệ thống
    bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final isLogin = ref.watch(tokenProvider).getRefreshToken()?.isNotEmpty ?? false;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode:isDarkMode ? ThemeMode.dark : ThemeMode.light,
      // home : isLogin?NewHomeScreen() : WelcomeScreen()
      home: AddLessonScreen(courseId: 1,),
    );
  }
}
