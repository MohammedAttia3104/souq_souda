import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';

class GoldTabBar extends StatelessWidget {
  const GoldTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.0.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0.r),
        ),
        color: AppColors.kGreyBehindColor,
      ),
      child: TabBar(
        labelStyle: AppStyles.style14Bold.copyWith(
          color: AppColors.kBlackNorColor,
        ),
        labelPadding: EdgeInsets.symmetric(
          horizontal: 12.0.w,
          vertical: 13.0.h,
        ),
        unselectedLabelColor: AppColors.kWhiteColor,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0.r),
          ),
          color: AppColors.kYellowNorColor,
        ),
        dividerHeight: 0,
        tabs: const [
          Text(AppStrings.coins),
          Text(AppStrings.ingots),
          Text(AppStrings.goldLabel),
        ],
      ),
    );
  }
}
