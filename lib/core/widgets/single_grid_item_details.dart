import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/widgets/cached_image.dart';
import 'package:souq_souda/core/widgets/custom_vertical_divider.dart';
import 'package:souq_souda/currency/presentation/widgets/favorite_bank_widget.dart';

class SingleGridItemDetails extends StatelessWidget {
  SingleGridItemDetails({
    super.key,
    required this.itemImagePath,
    required this.itemName,
    this.isFavoriteAvailable = false,
  });

  final String itemImagePath;
  final String itemName;
  bool isFavoriteAvailable;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.0.h,
      width: 170.0.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0.r),
        ),
        color: AppColors.kGreyBehindColor,
        border: Border.all(
          color: AppColors.kGreySubTitleColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          right: 4.5.w,
          left: 4.5.w,
          top: 10.5.h,
          bottom: 9.0.h,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: SizedBox(
                    height: 47.0.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share_outlined,
                            color: AppColors.kWhiteColor,
                            size: 20.0.r,
                          ),
                        ),
                        Container(
                          height: 47.0.h,
                          width: 47.0.w,
                          clipBehavior: Clip.antiAlias,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(),
                          ),
                          child: CachedImage(
                            imagePath: itemImagePath,
                            height: 47.0.h,
                            width: 47.0.w,
                          ),
                        ),
                        isFavoriteAvailable
                            ? const BankFavoriteWidget()
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppPadding.padding9h,
              ),
              FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  itemName,
                  style: AppStyles.style13Bold,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: AppPadding.padding9h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        AppStrings.buy,
                        style: AppStyles.style10Bold.copyWith(
                          color: AppColors.kGreyColor,
                          fontSize: AppFonts.fSize8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 8.0.h,
                      ),
                      Text(
                        '30.5 EGP',
                        style: AppStyles.style9Extra,
                      ),
                    ],
                  ),
                  CustomVerticalDivider(
                    horizontalPadding: 26.0.w,
                    height: 18.0.h,
                  ),
                  Column(
                    children: [
                      Text(
                        AppStrings.sell,
                        style: AppStyles.style10Bold.copyWith(
                          color: AppColors.kGreyColor,
                          fontSize: AppFonts.fSize8,
                        ),
                      ),
                      SizedBox(
                        height: 8.0.h,
                      ),
                      Text(
                        '30.5 EGP',
                        style: AppStyles.style9Extra,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
