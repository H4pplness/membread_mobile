import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  dividerColor: Colors.grey[700],
  primaryColor: Color.lerp(const Color.fromARGB(255, 89, 139, 255),
      const Color.fromARGB(255, 68, 124, 255), 1)!,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      background: const Color.fromARGB(255, 24, 26, 31),
      primary: Color.lerp(const Color.fromARGB(255, 89, 139, 255),
          const Color.fromARGB(255, 68, 124, 255), 1)!,
      secondary: Colors.grey[800]!,

  ),
  iconTheme: const IconThemeData(size: 20, color: Colors.white),
  appBarTheme: AppBarTheme(
      backgroundColor: const Color.fromARGB(255, 24, 26, 31),
      elevation: 0,
      titleTextStyle: GoogleFonts.montserrat(
          textStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20)),
      iconTheme: const IconThemeData(size: 25, color: Colors.white)),
  textTheme: TextTheme(
      titleLarge: GoogleFonts.montserrat(
          textStyle: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white)),
      titleMedium: GoogleFonts.montserrat(
          textStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white)),
      titleSmall: GoogleFonts.montserrat(
          textStyle: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white)),
      displayMedium: GoogleFonts.montserrat(
          textStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white)),
      displayLarge: GoogleFonts.montserrat(
          textStyle: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white)),
      displaySmall: GoogleFonts.montserrat(
          textStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white)),
      labelMedium: GoogleFonts.montserrat(
          textStyle: const TextStyle(
              fontSize: 19, fontWeight: FontWeight.w500, color: Colors.white)),
      labelLarge: GoogleFonts.montserrat(
          textStyle: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white)),
      labelSmall: GoogleFonts.montserrat(
          textStyle: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white))),
);
