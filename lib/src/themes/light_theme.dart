import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
    dividerColor: Colors.grey[300],
    brightness: Brightness.light,
    primaryColor: Color.lerp(const Color.fromARGB(255, 89, 139, 255),
        const Color.fromARGB(255, 68, 124, 255), 1)!,
    colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: Color.lerp(const Color.fromARGB(255, 89, 139, 255),
          const Color.fromARGB(255, 68, 124, 255), 1)!,
      secondary: Colors.grey[200]!,
    ),
    iconTheme: const IconThemeData(size: 20, color: Colors.black),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20)),
        iconTheme: const IconThemeData(size: 25, color: Colors.black)),
    textTheme: TextTheme(
        titleLarge: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black)),
        titleMedium: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        titleSmall: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        displayMedium: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black)),
        displayLarge: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        displaySmall: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black)),
        labelMedium: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        labelLarge: GoogleFonts.montserrat(
            textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white)),
        labelSmall: GoogleFonts.montserrat(
            textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white))
    ));
