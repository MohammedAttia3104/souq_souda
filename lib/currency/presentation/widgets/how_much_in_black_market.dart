import 'package:flutter/material.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';

class HowMuchInBlackMarket extends StatelessWidget {
  const HowMuchInBlackMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.blackMarket,
          style: AppStyles.style28Extra,
        ),
        SizedBox(
          height: AppPadding.padding14h,
        ),
        Text(
          AppStrings.howMuchInBlackMarket,
          style: AppStyles.style14Bold.copyWith(
            color: AppColors.kYellowLightActColor,
          ),
        ),
      ],
    );
  }
}
