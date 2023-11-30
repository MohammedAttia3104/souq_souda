import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';

abstract class AppThemes {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kBlackNorColor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kYellowNorColor),
    fontFamily: 'Almarai',
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.kGreyBehindColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(11.0.r)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(11.0.r)),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(11.0.r)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(11.0.r)),
      ),
      filled: true,
      fillColor: const Color(0xff2A2A2A),
      // prefixIconColor: AppColors.kGreyNorColor,
      // hoverColor: AppColors.kBlackHovColor,
      // focusColor: AppColors.kBlackLightActColor,
      hintStyle: TextStyle(
        fontSize: 14.0.sp,
        color: AppColors.kGreyNorColor,
      ),
    ),
  );
}
