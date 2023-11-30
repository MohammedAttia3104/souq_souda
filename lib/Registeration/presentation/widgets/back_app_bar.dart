import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';

class BackAppBar extends StatelessWidget {
  const BackAppBar({
    super.key,
    required this.barTitle,
  });

  final String barTitle;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: AppPadding.padding120h,
        child: Row(
          children: [
            Container(
              height: 40.0.h,
              width: 40.0.w,
              decoration: BoxDecoration(
                color: AppColors.kGreyBehindColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    16.0.r,
                  ),
                ),
              ),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.kWhiteColor,
                ),
              ),
            ),
            SizedBox(
              width: 53.5.w,
            ),
            Text(
              barTitle,
              style: AppStyles.style18Bold,
            ),
          ],
        ),
      ),
    );
  }
}

// AppBar(
// centerTitle: true,
// title: Text(
// AppStrings.createNewAccount,
// style: AppStyles.style18Bold,
// ),
// elevation: 0.0,
// backgroundColor: Theme.of(context).scaffoldBackgroundColor,
// leading: Padding(
// padding: EdgeInsetsDirectional.only(
// start: 24.0.w,
// ),
// child: Container(
// height: 40.0.h,
// width: 40.0.w,
// decoration: BoxDecoration(
// color: AppColors.kGreyBehindColor,
// borderRadius: BorderRadius.all(
// Radius.circular(
// 16.0.r,
// ),
// ),
// ),
// child: IconButton(
// onPressed: () => Navigator.of(context).pop(),
// icon: const Icon(
// Icons.arrow_back,
// color: AppColors.kWhiteColor,
// ),
// ),
// ),
// ),
// ),
