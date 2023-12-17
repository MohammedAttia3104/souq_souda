import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/widgets/circular_indicator.dart';
import 'package:souq_souda/gold/presentation/controllers/company/company_cubit.dart';
import 'package:souq_souda/gold/presentation/controllers/ingots_and_coins/ingots_and_coins_cubit.dart';
import 'package:souq_souda/gold/presentation/widgets/company_list_view.dart';

class IngotsBody extends StatelessWidget {
  const IngotsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const CompanyListView(),
          SizedBox(
            height: AppPadding.padding24h,
          ),
          BlocBuilder<IngotsAndCoinsCubit, IngotsAndCoinsState>(
            builder: (context, state) {
              if (state is IngotsLoadingState) {
                return CircularIndicator(height: 100.0.h);
              }
              if (state is IngotsSuccessState) {
                debugPrint("IngotsSuccessState");
                var id = context.read<CompanyCubit>().companyEntity?.id;
                List<Widget> goldDataItems = [];
                for (var e in state.ingots) {
                  for (var i in e.companiesData) {
                    debugPrint("Weight : ${e.weight.toString()}");
                    double weight = e.weight.toDouble();
                    double tax = i.tax;
                    double totalTax = weight * tax;
                    double workManShip = i.workmanship;
                    double sellPrice = e.price.sellPrice;
                    double returnFess = i.returnFees;
                    double totalPrice =
                        (weight * sellPrice) + workManShip + totalTax;
                    double difference = workManShip - returnFess;
                    if (i.companyId == id) {
                      debugPrint(
                          "IngotsSuccessState1.............................");
                      debugPrint(e.name);
                      debugPrint(i.id.toString());
                        ExpansionTileGroup(
                          toggleType: ToggleType.expandOnlyCurrent,
                          spaceBetweenItem: 18.0.h,
                          children: [
                            ExpansionTileBorderItem(
                              title: Text(
                                e.name,
                                style: AppStyles.style16Bold.copyWith(
                                  color: AppColors.kWhiteColor,
                                ),
                              ),
                              expendedBorderColor: AppColors.kYellowNorColor,
                              childrenPadding: EdgeInsets.all(18.0.h),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0.r,),),
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
                              border: Border.all(
                                width: 2,
                                color: AppColors.kYellowNorColor,
                              ),
                              children: [
                                ExpandedContainerDetails(
                                  workManShip: workManShip,
                                  totalTax: totalTax,
                                  totalPrice: totalPrice,
                                  returnFess: returnFess,
                                  difference: difference,
                                  pricePerGram: sellPrice,
                                ),
                              ],
                            ),
                          ],
                      );
                    }else{
                      goldDataItems.add(
                        ExpansionTileGroup(
                          toggleType: ToggleType.expandOnlyCurrent,
                          spaceBetweenItem: 18.0.h,
                          children: [
                            ExpansionTileBorderItem(
                              title: Text(
                                e.name,
                                style: AppStyles.style16Bold.copyWith(
                                  color: AppColors.kWhiteColor,
                                ),
                              ),
                              expendedBorderColor: AppColors.kYellowNorColor,
                              childrenPadding: EdgeInsets.all(18.0.h),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0.r)),
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
                              border: Border.all(
                                width: 2,
                                color: AppColors.kYellowNorColor,
                              ),
                              children: [
                                ExpandedContainerDetails(
                                  workManShip: workManShip,
                                  totalTax: totalTax,
                                  totalPrice: totalPrice,
                                  returnFess: returnFess,
                                  difference: difference,
                                  pricePerGram: sellPrice,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  }
                }
              }
              if (state is IngotsErrorState) {
                debugPrint("IngotsErrorState");
                return Text(state.error);
              }
              return const SizedBox();
            },
          ),
          SizedBox(
            height: AppPadding.padding24h,
          ),
        ],
      ),
    );
  }
}

class ExpandedContainerDetails extends StatelessWidget {
  const ExpandedContainerDetails({
    super.key,
    required this.workManShip,
    required this.totalTax,
    required this.totalPrice,
    required this.returnFess,
    required this.difference,
    required this.pricePerGram,
  });

  final double workManShip;
  final double totalTax;
  final double totalPrice;
  final double returnFess;
  final double difference;
  final double pricePerGram;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Price Per Gram',
              style: AppStyles.style14Bold,
            ),
            Text(
              '$pricePerGram EGP',
              style: AppStyles.style14Bold,
            ),
          ],
        ),
        SizedBox(
          height: AppPadding.padding18h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Workmanship',
              style: AppStyles.style14Bold,
            ),
            Text(
              '$workManShip EGP',
              style: AppStyles.style14Bold,
            ),
          ],
        ),
        SizedBox(
          height: AppPadding.padding18h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total tax',
              style: AppStyles.style14Bold,
            ),
            Text(
              '$totalTax EGP',
              style: AppStyles.style14Bold,
            ),
          ],
        ),
        SizedBox(
          height: AppPadding.padding18h,
        ),
        FittedBox(
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300.0.w,
                child: Text(
                  'Total price including workmanship and tax',
                  style: AppStyles.style14Bold.copyWith(
                    color: AppColors.kYellowNorColor,
                    fontWeight: FontWeight.w900,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '$totalPrice EGP',
                style: AppStyles.style14Bold.copyWith(
                  color: AppColors.kYellowNorColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppPadding.padding18h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Return Fees',
              style: AppStyles.style14Bold,
            ),
            Text(
              '$returnFess EGP',
              style: AppStyles.style14Bold,
            ),
          ],
        ),
        SizedBox(
          height: AppPadding.padding18h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Difference',
              style: AppStyles.style14Bold,
            ),
            Text(
              '$difference EGP',
              style: AppStyles.style14Bold,
            ),
          ],
        ),
      ],
    );
  }
}
