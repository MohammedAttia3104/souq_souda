import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_styles.dart';

class PriceWidget extends StatelessWidget {
  PriceWidget({
    super.key,
    required this.price,
    required this.buyOrSell,
    this.txtColor = AppColors.kGreyColor,
    this.priceColor = AppColors.kWhiteColor,
    this.txt1Size,
    this.txt2Size,
  });

  final double price;
  final String buyOrSell;
  double? txt1Size = 8.0.sp;

  double? txt2Size = 8.0.sp;
  Color txtColor;
  Color priceColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          buyOrSell,
          style: AppStyles.style10Bold.copyWith(
            color: txtColor,
            fontSize: txt1Size,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 8.0.h,
        ),
        Text(
          price.toString(),
          style: AppStyles.style9Extra.copyWith(
            color: priceColor,
            fontSize: txt2Size,
          ),
        ),
      ],
    );
  }
}
