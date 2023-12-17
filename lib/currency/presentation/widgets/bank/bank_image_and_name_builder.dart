import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/widgets/cached_image.dart';
import 'package:souq_souda/core/widgets/circular_indicator.dart';
import 'package:souq_souda/currency/presentation/controllers/currency/currency_details_cubit.dart';

class BankImageAndNameBuilder extends StatelessWidget {
  const BankImageAndNameBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyDetailsCubit, CurrencyDetailsState>(
      builder: (context, state) {
        if (state is BanksLoadingState) {
          return CircularIndicator(height: 24.0.h);
        }
        if (state is BanksSuccessState) {
          return Row(
            children: [
              CachedImage(
                imagePath: ApiConstants.storageUrl(state.banks[1].icon),
                height: 22.0.h,
                width: 22.0.w,
              ),
              SizedBox(
                width: AppPadding.padding6w,
              ),
              Text(
                state.banks[1].name,
                style: AppStyles.style12Bold,
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}

///ToDo : Circular Indicator
