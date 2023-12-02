import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/widgets/circular_indicator.dart';
import 'package:souq_souda/currency/presentation/controllers/bank/bank_cubit.dart';
import 'package:souq_souda/core/widgets/single_grid_item_details.dart';

class BankItemGridView extends StatelessWidget {
  const BankItemGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankCubit, BankState>(
      buildWhen: (previous, current) {
        return previous != current && current is BanksSuccessState;
      },
      builder: (context, state) {
        if (state is BanksLoadingState) {
          return CircularIndicator(
            height: 100.0.h,
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
                buyPrice: 30.5,
                sellPrice: 30.5,
                containerBackgroundColor:
                    state.banks[index].name == 'Central Bank of Egypt'
                        ? AppColors.kYellowNorColor
                        : AppColors.kGreyBehindColor,
              ),
            ),
          );
        }
        return CircularIndicator(
          height: 100.0.h,
        );
      },
    );
  }
}

///ToDo : Handle Central Bank fonts and Colors