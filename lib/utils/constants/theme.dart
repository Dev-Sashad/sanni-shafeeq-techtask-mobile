import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_task/_lib.dart';

class AppTheme {
  AppTheme._();

  /// The app was designed in a light theme mode so, there's no dark theme data
  /// for now
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primaryColor,
      secondary: Colors.cyan,
      background: AppColors.white,
      onBackground: AppColors.white,
      surface: AppColors.grey,
      onSurface: AppColors.grey,
    ),
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primaryColor,
    fontFamily: GoogleFonts.nunitoTextTheme().bodyText1!.fontFamily,
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.josefinSans(
        fontSize: 32.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: GoogleFonts.josefinSans(
        fontSize: 28.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.ibmPlexSans(
        fontSize: 28.sp,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
      titleMedium: GoogleFonts.nunito(
        fontSize: 20.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      bodyLarge: GoogleFonts.nunito(
        fontSize: 18.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.nunito(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      bodySmall: GoogleFonts.nunito(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
    buttonTheme:
        const ButtonThemeData(buttonColor: AppColors.primaryColor, height: 58),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
