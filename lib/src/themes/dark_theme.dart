import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  dividerColor: Colors.grey[700],
  primaryColor: Color.lerp(const Color.fromARGB(255, 59, 117, 245),
      const Color.fromARGB(255, 76, 142, 246), 1)!,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      background: const Color.fromARGB(255, 24, 26, 31),
      primary: Color.lerp(const Color.fromARGB(255, 59, 117, 245),
          const Color.fromARGB(255, 76, 142, 246), 1)!,
      secondary: Colors.grey[800]!),
  iconTheme: const IconThemeData(size: 20, color: Colors.white),
  appBarTheme: AppBarTheme(
      backgroundColor: const Color.fromARGB(255, 24, 26, 31),
      elevation: 0,
      titleTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20)),
      iconTheme: const IconThemeData(size: 25, color: Colors.white)),
  textTheme: TextTheme(
      titleLarge: GoogleFonts.notoSans(
          textStyle: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white)),
      titleMedium: GoogleFonts.notoSans(
          textStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
      titleSmall: GoogleFonts.notoSans(
          textStyle: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white)),
      displayMedium: GoogleFonts.notoSans(
          textStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white)),
      displayLarge: GoogleFonts.notoSans(
          textStyle: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white)),
      displaySmall: GoogleFonts.notoSans(
          textStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white)),
      labelMedium: GoogleFonts.notoSans(
          textStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
      labelLarge: GoogleFonts.notoSans(
          textStyle: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white)),
      labelSmall: GoogleFonts.notoSans(
          textStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white))),
);
