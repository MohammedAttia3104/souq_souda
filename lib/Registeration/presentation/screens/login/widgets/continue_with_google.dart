import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_assets.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/widgets/custom_text_button.dart';

class ContinueWithGoogle extends StatelessWidget {
  const ContinueWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      btnText: AppStrings.continueWithGoogle,
      onPressed: () {},
      btnBackgroundColor: AppColors.kGreyBehindColor,
      btnTxtColor: AppColors.kWhiteColor,
      iconWidget: Image.asset(
        AppAssets.googleIconImage,
        height: 20.0.h,
        width: 20.0.w,
      ),
    );
  }
}
