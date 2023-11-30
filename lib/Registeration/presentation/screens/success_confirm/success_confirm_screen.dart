import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_assets.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/widgets/custom_text_button.dart';

class SuccessConfirmScreen extends StatelessWidget {
  const SuccessConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: AppPadding.padding24w,
        ),
        child: Column(
          children: [
            SizedBox(
              height: AppPadding.padding250h,
            ),
            Image.asset(
              AppAssets.confirmSuccess,
              height: 183.0.h,
              width: 205.0.w,
            ),
            SizedBox(
              height: AppPadding.padding47h,
            ),
            Text(
              AppStrings.confirmSuccessDone,
              style: AppStyles.style22Bold,
            ),
            SizedBox(
              height: AppPadding.padding170h,
            ),
            CustomTextButton(
              btnText: AppStrings.confirmSuccessToMain,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
