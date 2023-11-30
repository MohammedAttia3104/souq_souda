import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/widgets/custom_vertical_divider.dart';

class PricesInBankAndBlackMarket extends StatelessWidget {
  const PricesInBankAndBlackMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              AppStrings.bankPriceEng,
              style: AppStyles.style10Bold.copyWith(
                color: AppColors.kGreyColor,
              ),
            ),
            SizedBox(
              height: AppPadding.padding10h,
            ),
            Text(
              '40 EGP',
              style: AppStyles.style10Extra,
            ),
          ],
        ),
        CustomVerticalDivider(
          horizontalPadding: 25.0.w,
          height: 40.0.h,
        ),
        Column(
          children: [
            Text(
              AppStrings.lastUpdate,
              style: AppStyles.style10Bold.copyWith(
                color: AppColors.kGreyColor,
              ),
            ),
            SizedBox(
              height: 10.0.h,
            ),
            Text(
              '15 minute',
              style: AppStyles.style10Extra.copyWith(
                color: AppColors.kBlackNorColor,
              ),
            ),
          ],
        ),
        CustomVerticalDivider(
          horizontalPadding: 25.0.w,
          height: 40.0.h,
        ),
        Column(
          children: [
            Text(
              AppStrings.bankPriceEng,
              style: AppStyles.style10Bold.copyWith(
                color: AppColors.kGreyColor,
              ),
            ),
            SizedBox(
              height: 10.0.h,
            ),
            Text(
              '30.5 EGP',
              style: AppStyles.style10Extra.copyWith(
                color: AppColors.kBlackNorColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
