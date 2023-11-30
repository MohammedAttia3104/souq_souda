import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/widgets/cached_image.dart';
import 'package:souq_souda/currency/domain/entities/currency_entity.dart';
import 'package:souq_souda/currency/presentation/controllers/currency_details_cubit.dart';

class DropDownDetails extends StatefulWidget {
  const DropDownDetails({super.key});

  @override
  State<DropDownDetails> createState() => _DropDownDetailsState();
}

class _DropDownDetailsState extends State<DropDownDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrencyDetailsCubit, CurrencyDetailsState>(
      buildWhen: (previous, current) =>
          previous != current && current is CurrencyDetailsSuccessState,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CurrencyDetailsLoadingState) {
          SizedBox(
            height: 20.0.h,
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.kYellowNorColor,
              ),
            ),
          );
        }
        if (state is CurrencyDetailsSuccessState) {
          CurrencyEntity? currency = state.currencies[0];
          debugPrint(ApiConstants.storagePath + state.currencies[0].icon);
          return SizedBox(
            height: 20.0.h,
            width: 250.0.w,
            child: DropdownButtonFormField(
              value: currency,
              elevation: 0,
              items: state.currencies.map<DropdownMenuItem<CurrencyEntity>>(
                (CurrencyEntity value) {
                  return DropdownMenuItem<CurrencyEntity>(
                    value: value,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CachedImage(
                          imagePath: ApiConstants.storagePath + value.icon,
                          width: 20.0.w,
                          height: 20.0.h,
                        ),
                        SizedBox(width: 8.0.w),
                        Text(
                          value.name,
                          style: AppStyles.style10Bold,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
              onChanged: (CurrencyEntity? newValue) {
                setState(() {
                  currency = newValue;
                });
              },
              decoration: InputDecoration(
                fillColor: AppColors.kWhiteColor,
                filled: true,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.kWhiteColor,
                  ),
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.kWhiteColor,
                  ),
                ),
                disabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.kWhiteColor,
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.kWhiteColor,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 5.0.w),
              ),
            ),
          );
        }
        return SizedBox(
          height: 20.0.h,
          width: 20.0.w,
          child: const Center(
            child: CircularProgressIndicator(
              color: AppColors.kYellowNorColor,
            ),
          ),
        );
      },
    );
  }
}
