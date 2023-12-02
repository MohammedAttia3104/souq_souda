import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/services/services_locator.dart';
import 'package:souq_souda/core/widgets/cached_image.dart';
import 'package:souq_souda/core/widgets/circular_indicator.dart';
import 'package:souq_souda/gold/presentation/controllers/company/company_cubit.dart';

class CompanyListView extends StatelessWidget {
  const CompanyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 71.0.h,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 46.0.h,
                width: 46.0.w,
                clipBehavior: Clip.antiAlias,
                decoration: const ShapeDecoration(
                  shape: OvalBorder(),
                ),
                child: CachedImage(
                  imagePath:
                      "${ApiConstants.storagePath}gold-companies/May2023/PXFhLJS88eT3xMONb3gA.png",
                  height: 46.0.h,
                  width: 46.0.w,
                ),
              ),
              SizedBox(
                height: AppPadding.padding6h,
              ),
              Text(
                "BBC",
                style: AppStyles.style12Bold.copyWith(
                  color: AppColors.kWhiteColor,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: AppPadding.padding12w,
          );
        },
        itemCount: 10,
      ),
    );
  }

// return BlocBuilder<CompanyCubit, CompanyState>(
//   buildWhen: (previous, current) {
//     return previous != current && current is CompanySuccessState;
//   },
//   builder: (context, state) {
//     if (state is CompanyLoadingState) {
//       return CircularIndicator(height: 40.0.h);
//     }
//     if (state is CompanySuccessState) {
//       return SizedBox(
//         height: 70.0.h,
//         width: double.infinity,
//         child: ListView.separated(
//           scrollDirection: Axis.horizontal,
//           physics: const BouncingScrollPhysics(),
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             return Column(
//               children: [
//                 Container(
//                   height: 46.0.h,
//                   width: 46.0.w,
//                   clipBehavior: Clip.antiAlias,
//                   decoration: const ShapeDecoration(
//                     shape: OvalBorder(),
//                   ),
//                   child: CachedImage(
//                     imagePath: ApiConstants.storagePath +
//                         state.companies[index].image,
//                     height: 46.0.h,
//                     width: 46.0.w,
//                   ),
//                 ),
//                 SizedBox(
//                   height: AppPadding.padding6h,
//                 ),
//                 Text(
//                   state.companies[index].name,
//                   style: AppStyles.style12Bold.copyWith(
//                     color: AppColors.kWhiteColor,
//                   ),
//                 ),
//               ],
//             );
//           },
//           separatorBuilder: (context, index) {
//             return SizedBox(
//               width: AppPadding.padding12w,
//             );
//           },
//           itemCount: state.companies.length,
//         ),
//       );
//     }
//     return CircularIndicator(height: 40.0.h);
//   },
// );
}
