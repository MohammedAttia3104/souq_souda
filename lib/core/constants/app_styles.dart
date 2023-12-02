import 'package:flutter/material.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/size_config.dart';

abstract class AppStyles {
  static TextStyle style7Bold = TextStyle(
    fontSize: AppFonts.fSize7,
    fontWeight: FontWeight.w700,
    color: AppColors.kBlackNorColor,
  );
  static TextStyle style8Bold = TextStyle(
    fontSize: AppFonts.fSize8,
    fontWeight: FontWeight.w700,
    color: AppColors.kBlackNorColor,
  );
  static TextStyle style9Extra = TextStyle(
    fontSize: AppFonts.fSize9,
    fontWeight: FontWeight.w800,
    color: AppColors.kWhiteColor,
  );
  static TextStyle style10Bold = TextStyle(
    fontSize: AppFonts.fSize10,
    fontWeight: FontWeight.w700,
    color: AppColors.kBlackNorColor,
  );
  static TextStyle style10Extra = TextStyle(
    fontSize: AppFonts.fSize10,
    fontWeight: FontWeight.w800,
    color: AppColors.kYellowNorColor,
  );
  static TextStyle style12Bold = TextStyle(
    fontSize: AppFonts.fSize12,
    fontWeight: FontWeight.w700,
  );

  static TextStyle style12Nor = TextStyle(
    fontSize: AppFonts.fSize12,
    color: AppColors.kWhiteColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle style13Bold = TextStyle(
    fontSize: AppFonts.fSize13,
    fontWeight: FontWeight.w700,
    color: AppColors.kWhiteColor,
  );
  static TextStyle style14Bold = TextStyle(
    color: AppColors.kWhiteColor,
    fontSize: AppFonts.fSize14,
    fontWeight: FontWeight.w700,
  );
  static TextStyle style16Bold = TextStyle(
    fontSize: AppFonts.fSize16,
    fontWeight: FontWeight.w700,
  );
  static TextStyle style18Bold = TextStyle(
    color: AppColors.kWhiteColor,
    fontSize: AppFonts.fSize18,
    fontWeight: FontWeight.w700,
  );
  static TextStyle style22Bold = TextStyle(
    color: AppColors.kYellowNorColor,
    fontSize: AppFonts.fSize22,
    fontWeight: FontWeight.w700,
  );
  static TextStyle style26Bold = TextStyle(
    color: AppColors.kWhiteColor,
    fontSize: AppFonts.fSize26,
    fontWeight: FontWeight.w700,
  );
  static TextStyle style28Extra = TextStyle(
    color: AppColors.kYellowNorColor,
    fontSize: AppFonts.fSize28,
    fontWeight: FontWeight.w800,
  );
  static TextStyle txtFieldInputStyle = const TextStyle(
    color: AppColors.kWhiteColor,
  );
  static TextStyle hintStyle = TextStyle(
    fontSize: AppFonts.fSize14,
    color: AppColors.kGreyNorColor,
  );
}
