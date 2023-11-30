import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    super.key,
    required this.btnText,
    this.btnBackgroundColor = AppColors.kYellowNorColor,
    this.btnTxtColor = AppColors.kBlackNorColor,
    this.iconWidget = const SizedBox(),
    this.btnWidth = double.infinity,
    required this.onPressed,
  });

  final String btnText;
  final VoidCallback? onPressed;
  Color btnBackgroundColor;
  Color btnTxtColor;
  Widget iconWidget;
  double btnWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: btnWidth,
      height: 52.0.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(btnBackgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  14.0.r,
                ), // Adjust the radius as needed
              ),
            ),
          ),
          onPressed: onPressed,
          icon: iconWidget,
          label: Text(
            btnText,
            style: AppStyles.style16Bold.copyWith(
              color: btnTxtColor,
            ),
          ),
        ),
      ),
    );
  }
}
