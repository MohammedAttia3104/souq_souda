import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/widgets/circular_indicator.dart';
import 'package:souq_souda/core/widgets/single_grid_item_details.dart';
import 'package:souq_souda/gold/presentation/controllers/gold/gold_cubit.dart';

class GoldGridView extends StatelessWidget {
  const GoldGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoldCubit, GoldState>(
      buildWhen: (previous, current) {
        return previous != current && current is GoldSuccessState;
      },
      builder: (context, state) {
        if (state is GoldSuccessState) {
          return SingleChildScrollView(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 6.5.w,
              mainAxisSpacing: 10.0.h,
              childAspectRatio: 1.05 / 1,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                state.golds.length,
                (index) {
                  return SingleGridItemDetails(
                    itemImagePath:
                        ApiConstants.storagePath + state.golds[index].icon,
                    itemName: state.golds[index].name,
                    buyPrice: state.golds[index].goldPrice.buyPrice,
                    sellPrice: state.golds[index].goldPrice.price,
                  );
                },
              ),
            ),
          );
        }
        return CircularIndicator(height: 500.0.h);
      },
    );
  }
}

///ToDo : Handle Circular Progress indicator life time (timing)