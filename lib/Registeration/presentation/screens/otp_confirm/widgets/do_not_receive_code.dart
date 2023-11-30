import 'package:flutter/cupertino.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';

class DoNotReceiveCode extends StatelessWidget {
  const DoNotReceiveCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppPadding.padding43h,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.doNotReceiveCode,
                style: AppStyles.style14Bold,
              ),
              Text(
                AppStrings.resendCode,
                style: AppStyles.style14Bold.copyWith(
                  color: AppColors.kYellowNorColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppPadding.padding292h,
        ),
      ],
    );
  }
}
