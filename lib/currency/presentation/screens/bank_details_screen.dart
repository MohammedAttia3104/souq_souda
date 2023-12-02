import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/Registeration/presentation/widgets/back_app_bar.dart';
import 'package:souq_souda/core/constants/app_assets.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/widgets/custom_vertical_divider.dart';
import 'package:souq_souda/currency/presentation/widgets/bank/bank_container_details.dart';
import 'package:souq_souda/currency/presentation/widgets/bank/bank_currency_price_container.dart';
import 'package:souq_souda/currency/presentation/widgets/currency/drop_down_details.dart';
import 'package:souq_souda/currency/presentation/widgets/how_much_in_black_market.dart';
import 'package:souq_souda/currency/presentation/widgets/price_widget.dart';

class BankDetailsScreen extends StatelessWidget {
  const BankDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  AppAssets.combinedShape,
                  fit: BoxFit.contain,
                  height: 315.0.h,
                  width: double.infinity,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: AppPadding.padding24w,
                  ),
                  child: Column(children: [
                    BackAppBar(
                      barTitle: '',
                      btnBackgroundColor: AppColors.kBlackNorColor,
                    ),
                    const HowMuchInBlackMarket(),
                    SizedBox(
                      height: AppPadding.padding35h,
                    ),
                    const BankContainerDetails(),
                  ]),
                )
              ],
            ),
            SizedBox(
              height: AppPadding.padding18h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: AppPadding.padding24w,
              ),
              child: Column(
                children: [
                  const BankCurrencyPriceContainer(),
                  SizedBox(
                    height: AppPadding.padding18h,
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: AppPadding.padding12w,
                      vertical: AppPadding.padding11h,
                    ),
                    height: AppPadding.padding112h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          12.0.r,
                        ),
                      ),
                      color: AppColors.kGreyBehindColor,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 45.0.w,
                              height: 18.0.h,
                              padding: EdgeInsets.all(4.5.h),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0.r)),
                                color: AppColors.kWhiteColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppStrings.egyCode,
                                    style: AppStyles.style7Bold,
                                  ),
                                  Image.asset(
                                    AppAssets.egyIcon,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.symmetric(
                                horizontal: AppPadding.padding14w,
                              ),
                              child: Image.asset(
                                AppAssets.currencyIconImage,
                                color: AppColors.kYellowNorColor,
                                width: 20.0.w,
                                height: 20.0.h,
                              ),
                            ),
                            Container(
                              width: 45.0.w,
                              height: 18.0.h,
                              padding: EdgeInsets.all(4.5.h),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0.r)),
                                color: AppColors.kWhiteColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppStrings.egyCode,
                                    style: AppStyles.style7Bold,
                                  ),
                                  Image.asset(
                                    AppAssets.egyIcon,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 30.0.h,
                              width: 80.0.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    7.0.r,
                                  ),
                                ),
                                color: AppColors.kYellowNorColor,
                              ),
                              padding: EdgeInsetsDirectional.only(
                                end: 14.5.w,
                                bottom: 4.5.h,
                                top: 4.5.h,
                              ),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      AppAssets.blueCalculatorIcon,
                                      height: 20.0.h,
                                      width: 20.0.w,
                                    ),
                                    SizedBox(
                                      width: AppPadding.padding4w,
                                    ),
                                    Text(
                                      AppStrings.calculator,
                                      style: AppStyles.style10Bold,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppPadding.padding11h,
                        ),
                        SizedBox(
                          width: 147.0.w,
                          height: 26.0.h,
                          child: TextField(
                            textDirection: TextDirection.rtl,
                            onTapOutside: (event) =>
                                FocusManager.instance.primaryFocus?.unfocus(),

                            ///ToDo : لم تكتمل بعد #######
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      6.0.r,
                                    ),
                                  ),
                                  borderSide: const BorderSide(
                                    width: 0.5,
                                    color: Color(0xff968787),
                                  ), 
                                ),
                                hintText: 'أدخل المبلغ',
                                hintTextDirection: TextDirection.rtl,
                                hintStyle: AppStyles.hintStyle.copyWith(
                                  fontSize: 8.0.sp,
                                ),
                                prefixIcon: Container(
                                  height: 26.0.h,
                                  width: 37.0.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.kYellowNorColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(6.0.r),
                                      bottomLeft: Radius.circular(6.0.r),
                                    ),
                                  ),
                                  padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: 6.5.w,
                                    vertical: 8.5.h,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Center(
                                      child: Text(
                                        'الحساب',
                                        style: AppStyles.style8Bold,
                                      ),
                                    ),
                                  ),
                                ),),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// children: [
// Text(
// 'EGP',
// style: AppStyles.style7Bold,
// ),
// Image.asset(
// AppAssets.egyIcon,
// fit: BoxFit.fitHeight,
// ),
// ],
// ),
