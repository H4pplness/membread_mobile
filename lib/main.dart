import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/firebase_options.dart';
import 'package:membreadflutter/src/core/firebase.dart';
import 'package:membreadflutter/src/database/local/core/share_preferences.dart';
import 'package:membreadflutter/src/database/local/token/save_firebase_token.dart';
import 'package:membreadflutter/src/database/local/token/token.dart';
import 'package:membreadflutter/src/screens/login_screen/login_screen.dart';
import 'package:membreadflutter/src/screens/new_home_screen/new_home_screen.dart';
import 'package:membreadflutter/src/screens/welcome_screen/welcome_screen.dart';
import 'package:membreadflutter/src/themes/dark_theme.dart';
import 'package:membreadflutter/src/themes/light_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  await FirebaseApi().initNotifications();
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
    ref.read(saveFirebaseTokenProvider);
    // Kiểm tra chế độ hiện tại của hệ thống
    bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final isLogin = ref.watch(tokenProvider).getRefreshToken()?.isNotEmpty ?? false;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode:isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home : isLogin?NewHomeScreen() : const WelcomeScreen()
      // home: LoginScreen(),
    );

  }
}


