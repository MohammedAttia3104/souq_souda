import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/currency/presentation/widgets/currency/drop_down_details.dart';
import 'package:souq_souda/currency/presentation/widgets/prices_in_bank_and_black_market_last_update.dart';

class BankAndBlackMarketPriceContainer extends StatelessWidget {
  const BankAndBlackMarketPriceContainer({super.key});

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
        padding: EdgeInsetsDirectional.symmetric(horizontal: 24.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: AppPadding.padding11h,
            ),
            const DropDownDetails(),
            SizedBox(
              height: 25.0.h,
            ),
            const PricesInBankAndBlackMarketLastUpdate(),
          ],
        ),
      ),
    );
  }
}
