import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/gold/presentation/screens/ingots_body.dart';
import 'package:souq_souda/gold/presentation/widgets/company_list_view.dart';

class CoinsBody extends StatelessWidget {
  const CoinsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const CompanyListView(),
          SizedBox(height: 20.0.h,),
          ExpansionTileGroup(
            toggleType: ToggleType.expandOnlyCurrent,
            spaceBetweenItem: 18.0.h,
            children: List.generate(
              10,
                  (index) {
                return ExpansionTileBorderItem(
                  title: Text(
                    'ExpansionTile item 2',
                    style: AppStyles.style16Bold.copyWith(
                      color: AppColors.kWhiteColor,
                    ),
                  ),
                  childrenPadding: EdgeInsets.all(18.0.h),
                  borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                  decoration: BoxDecoration(
                    color: AppColors.kGreyBehindColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10.0.r,
                      ),
                    ),
                  ),
                  iconColor: AppColors.kWhiteColor,
                  collapsedIconColor: AppColors.kWhiteColor,
                  backgroundColor: AppColors.kGreyBehindColor,
                  border: Border.all(width: 2,color:AppColors.kYellowNorColor, ),
                  children: const [
                    ExpandedContainerDetails(
                      workManShip: 20.0,
                      totalTax: 20.0,
                      totalPrice: 20.0,
                      returnFess: 20.0,
                      difference: 20.0,
                      pricePerGram: 20.0,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
