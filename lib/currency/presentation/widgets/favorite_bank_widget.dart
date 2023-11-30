import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';

class BankFavoriteWidget extends StatelessWidget {
  const BankFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.heart_broken,
        color: AppColors.kWhiteColor,
        size: 20.0.r,
      ),
    );
  }
}
