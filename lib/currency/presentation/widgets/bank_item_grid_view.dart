import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_assets.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/currency/presentation/controllers/currency_details_cubit.dart';
import 'package:souq_souda/core/widgets/single_grid_item_details.dart';
import 'package:souq_souda/currency/presentation/widgets/favorite_bank_widget.dart';

class BankItemGridView extends StatelessWidget {
  const BankItemGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyDetailsCubit, CurrencyDetailsState>(
      buildWhen: (previous, current) {
        return previous != current && current is BanksSuccessState;
      },
      builder: (context, state) {
        if (state is BanksLoadingState) {
          return SizedBox(
            height: 100.0.h,
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.kYellowNorColor,
              ),
            ),
          );
        }
        if (state is BanksSuccessState) {
          return GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 6.5.w,
            mainAxisSpacing: 10.0.h,
            childAspectRatio: 1.05 / 1,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: List.generate(
              state.banks.length,
              (index) => SingleGridItemDetails(
                itemImagePath:
                    ApiConstants.storagePath + state.banks[index].icon,
                itemName: state.banks[index].name,
                isFavoriteAvailable: true,
              ),
            ),
          );
        }
        return SizedBox(
          height: 100.0.h,
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
