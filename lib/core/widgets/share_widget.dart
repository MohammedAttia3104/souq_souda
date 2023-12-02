import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';

class ShareWidget extends StatelessWidget {
  const ShareWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {

      },
      icon: Icon(
        Icons.share_outlined,
        color: AppColors.kWhiteColor,
        size: 20.0.r,
      ),
    );
  }
}
