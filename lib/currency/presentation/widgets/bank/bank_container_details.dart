import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/currency/presentation/widgets/bank/bank_image_and_name_builder.dart';
import 'package:souq_souda/currency/presentation/widgets/currency/prices_in_bank_and_black_market_last_update.dart';

class BankContainerDetails extends StatelessWidget {
  const BankContainerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105.0.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            16.0.r,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 19.0.w,
          vertical: 11.0.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BankImageAndNameBuilder(),
            SizedBox(
              height: AppPadding.padding18h,
            ),
            const PricesInBankAndBlackMarketLastUpdate(),
          ],
        ),
      ),
    );
  }
}
