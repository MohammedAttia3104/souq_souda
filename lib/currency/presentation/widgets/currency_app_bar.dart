import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_assets.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';

class CurrencyAppBar extends StatelessWidget {
  const CurrencyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          //CircleAvatar
          Container(
            width: 48.0.w,
            height: 48.0.h,
            decoration: ShapeDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                  "https://via.placeholder.com/48x48",
                ),
                fit: BoxFit.cover,
              ),
              shape: OvalBorder(
                side: BorderSide(
                  width: 2.0.w,
                  color: const Color(0xFFBDBDBD),
                ),
              ),
            ),
          ),
          SizedBox(
            width: AppPadding.padding12w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.hello,
                style: AppStyles.style12Bold.copyWith(
                  color: AppColors.kBlackLightHovColor,
                ),
              ),
              SizedBox(
                height: AppPadding.padding10h,
              ),
              Text(
                AppStrings.name,
                style: AppStyles.style14Bold,
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 48.0.w,
            height: 48.0.h,
            padding: EdgeInsets.all(12.0.h),
            decoration: ShapeDecoration(
              color: const Color(0x660E0E0E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0.r),
              ),
            ),
            child: Image.asset(
              AppAssets.notificationIcon,
              color: AppColors.kWhiteColor,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
