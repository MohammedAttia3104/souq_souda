import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/widgets/cached_image.dart';
import 'package:souq_souda/core/widgets/custom_vertical_divider.dart';
import 'package:souq_souda/core/widgets/share_widget.dart';
import 'package:souq_souda/currency/presentation/widgets/favorite_bank_widget.dart';
import 'package:souq_souda/currency/presentation/widgets/price_widget.dart';

class SingleGridItemDetails extends StatelessWidget {
  SingleGridItemDetails({
    super.key,
    required this.itemImagePath,
    required this.itemName,
    this.isFavoriteAvailable = false,
    this.containerBackgroundColor = AppColors.kGreyBehindColor,
    required this.buyPrice,
    required this.sellPrice,
  });

  final String itemImagePath;
  final String itemName;
  final double buyPrice;
  final double sellPrice;
  bool isFavoriteAvailable;
  Color containerBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.0.h,
      width: 170.0.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0.r),
        ),
        color: containerBackgroundColor,
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
                        const ShareWidget(),
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
                            : SizedBox(
                                width: 45.0.w,
                              ),
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
                  PriceWidget(
                    price: 30.5,
                    buyOrSell: AppStrings.buy,
                  ),
                  CustomVerticalDivider(
                    horizontalPadding: 26.0.w,
                    height: 18.0.h,
                  ),
                  PriceWidget(
                    price: 30.5,
                    buyOrSell: AppStrings.sell,
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
