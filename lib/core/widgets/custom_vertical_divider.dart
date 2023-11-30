import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/size_config.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({
    super.key,
    required this.horizontalPadding,
    required this.height,
  });

  final double horizontalPadding;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: horizontalPadding,
      ),
      child: Container(
        height: height,
        width: CustomConfiguration.dividerWidth,
        color: AppColors.kBlackLightHovColor,
      ),
    );
  }
}
