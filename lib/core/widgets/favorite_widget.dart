import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_assets.dart';
import 'package:souq_souda/core/constants/app_colors.dart';

class BankFavoriteWidget extends StatelessWidget {
  const BankFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0.h,
      width: 30.0.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30.0.r),
        ),
        border: Border.all(
          color: AppColors.kGreyColor,
          width: 1.w,
        ),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Image.asset(
          AppAssets.loveIconImage,
          fit: BoxFit.cover,
          width: 20.0.w,
          height: 20.0.h,
        ),
        color:Colors.white,

      ),
    );
  }
}
