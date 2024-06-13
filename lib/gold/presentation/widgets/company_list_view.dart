import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/widgets/cached_image.dart';
import 'package:souq_souda/core/widgets/circular_indicator.dart';
import 'package:souq_souda/gold/presentation/controllers/company/company_cubit.dart';

class CompanyListView extends StatefulWidget {
  const CompanyListView({
    super.key,
  });

  @override
  State<CompanyListView> createState() => _CompanyListViewState();
}

class _CompanyListViewState extends State<CompanyListView> {
  bool isClicked = false;
  int clickedIndex = 0;
  SharedPreferences? prefs; // Declare SharedPreferences instance

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyCubit, CompanyState>(
      buildWhen: (previous, current) {
        return previous != current && current is CompanySuccessState;
      },
      builder: (context, state) {
        if (state is CompanyLoadingState) {
          return CircularIndicator(height: 40.0.h);
        }
        if (state is CompanySuccessState) {
          return SizedBox(
            height: 70.0.h,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isClicked = !isClicked;
                        clickedIndex = index;
                        debugPrint(state.companies[index].id.toString());
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 46.0.h,
                          width: 46.0.w,
                          clipBehavior: Clip.antiAlias,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(),
                          ),
                          child: CachedImage(
                            imagePath: ApiConstants.storageUrl(
                              state.companies[index].image,
                            ),
                            height: 46.0.h,
                            width: 46.0.w,
                          ),
                        ),
                        SizedBox(
                          height: AppPadding.padding6h,
                        ),
                        Text(
                          state.companies[index].name,
                          style: AppStyles.style12Bold.copyWith(
                            color: index == clickedIndex
                                ? AppColors.kYellowNorColor
                                : AppColors.kWhiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: AppPadding.padding12w,
                );
              },
              itemCount: state.companies.length,
            ),
          );
        }
        return CircularIndicator(height: 40.0.h);
      },
    );
  }
}
