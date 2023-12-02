import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/widgets/custom_vertical_divider.dart';
import 'package:souq_souda/currency/presentation/widgets/currency/drop_down_details.dart';
import 'package:souq_souda/currency/presentation/widgets/price_widget.dart';

class BankCurrencyPriceContainer extends StatelessWidget {
  const BankCurrencyPriceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105.0.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kYellowNorColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            16.0.r,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const DropDownDetails(),
          SizedBox(
            height: AppPadding.padding11hh,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PriceWidget(
                price: 30.5,
                buyOrSell: AppStrings.buy,
                priceColor: AppColors.kBlackNorColor,
                txtColor: AppColors.kBlackNorColor,
                txt1Size: 10.0.sp,
                txt2Size: 10.0.sp,
              ),
              CustomVerticalDivider(
                horizontalPadding: AppPadding.padding48w,
                height: 25.0.h,
              ),
              PriceWidget(
                price: 30.5,
                buyOrSell: AppStrings.sell,
                priceColor: AppColors.kBlackNorColor,
                txtColor: AppColors.kBlackNorColor,
                txt1Size: 10.0.sp,
                txt2Size: 10.0.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
