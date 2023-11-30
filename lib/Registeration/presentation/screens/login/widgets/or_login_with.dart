import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';

class OrLoginWith extends StatelessWidget {
  const OrLoginWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1.0.h,
          width: 135.0.w,
          color: AppColors.kGreyBehindColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.r),
          child: Text(
            AppStrings.orLoginWith,
            style: AppStyles.style12Nor,
          ),
        ),
        Container(
          height: 1.0.h,
          width: 135.0.w,
          color: AppColors.kGreyBehindColor,
        ),
      ],
    );
  }
}