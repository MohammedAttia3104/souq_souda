import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/currency/presentation/controllers/currency/currency_details_cubit.dart';

class PriceAndUpdateDetails extends StatelessWidget {
  const PriceAndUpdateDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyDetailsCubit, CurrencyDetailsState>(
      builder: (context, state) {
        if (state is CurrencyDetailsSuccessState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    AppStrings.bankPriceEng,
                    style: AppStyles.style10Bold.copyWith(
                      color: AppColors.kGreyColor,
                    ),
                  ),
                  SizedBox(
                    height: AppPadding.padding10h,
                  ),
                  Text(
                    '40 EGP',
                    style: AppStyles.style10Extra,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 25.0.w),
                child: Container(
                  height: 40.0.h,
                  width: 1.0.w,
                  color: AppColors.kBlackLightHovColor,
                ),
              ),
              Column(
                children: [
                  Text(
                    AppStrings.lastUpdate,
                    style: AppStyles.style10Bold.copyWith(
                      color: AppColors.kGreyColor,
                    ),
                  ),
                  SizedBox(
                    height: AppPadding.padding10h,
                  ),
                  Text(
                    '15 minute',
                    style: AppStyles.style10Extra
                        .copyWith(color: AppColors.kGreySubTitleColor),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 25.0.w),
                child: Container(
                  height: 40.0.h,
                  width: 1.0.w,
                  color: AppColors.kBlackLightHovColor,
                ),
              ),
              Column(
                children: [
                  Text(
                    AppStrings.bankPriceEng,
                    style: AppStyles.style10Bold.copyWith(
                      color: AppColors.kGreyColor,
                    ),
                  ),
                  SizedBox(
                    height: AppPadding.padding10h,
                  ),
                  Text(
                    '30.5 EGP',
                    style: AppStyles.style10Extra
                        .copyWith(color: AppColors.kGreySubTitleColor),
                  ),
                ],
              ),
            ],
          );

        }
        return const SizedBox();
      },
    );
  }
}
