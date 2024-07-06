import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    brightness: Brightness.light,
    primaryColorDark: Colors.black,
    primaryColorLight: Colors.white,
    fontFamily: "Poppins",
    textTheme: TextTheme(
        displayLarge: TextStyle(
            // color: AppColors.latteColor,
            // fontSize: 32.sp,
            ),
        displayMedium: TextStyle(
          color: AppColors.labelTextColor,
          fontSize: 18.sp,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
        ),
        displaySmall: TextStyle(
          color: AppColors.hintColor,
          fontSize: 21.sp,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          // color: AppColors.night,
          fontWeight: FontWeight.w400,
          // fontSize: 14.sp,
        ),
        bodySmall: TextStyle(
            // color: AppColors.latteColor,
            // fontSize: 12.sp,
            ),
        labelLarge: TextStyle(
          // color: AppColors.night,
          fontWeight: FontWeight.w500,
          // fontFamily: "NaN",
          // fontSize: 40.sp,
        ),
        titleMedium: TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins",
          fontSize: 20.sp,
        )),
  );
}
