import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';

class PasswordRecoveryInfo extends StatelessWidget {
  const PasswordRecoveryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.0.h,
      decoration: ShapeDecoration(
        color: AppColors.kGreyBehindColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8.0.r,
          ),
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            SizedBox(
              width: AppPadding.padding14w,
            ),
            Icon(
              Icons.info,
              size: 24.0.r,
              color: AppColors.kWhiteColor,
            ),
            SizedBox(
              width: AppPadding.padding16w,
            ),
            Text(
              AppStrings.passwordRecoveryDescrip,
              style: AppStyles.style12Bold.copyWith(
                color: AppColors.kWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
