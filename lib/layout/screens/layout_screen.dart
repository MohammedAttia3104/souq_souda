import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/layout/controllers/layout_cubit.dart';

class LayOutScreen extends StatelessWidget {
  const LayOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: cubit.layOutScreens[cubit.currentIndex],
          bottomNavigationBar: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              height: 94.0.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18.0.r),
                  topLeft: Radius.circular(18.0.r),
                ),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                currentIndex: cubit.currentIndex,
                unselectedItemColor: AppColors.kBlackLightHovColor,
                selectedItemColor: AppColors.kYellowNorColor,
                backgroundColor: AppColors.kGreyBehindColor,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
                items: List.generate(
                  cubit.layOutIcons.length,
                  (index) => BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 4.0.h),
                      child: Image.asset(
                        cubit.layOutIcons[index],
                        height: 25.0.h,
                        width: 25.0.w,
                        color: AppColors.kBlackLightHovColor,
                      ),
                    ),
                    activeIcon: Padding(
                      padding: EdgeInsets.only(bottom: 4.0.h),
                      child: Image.asset(
                        cubit.layOutIcons[index],
                        height: 25.0.h,
                        width: 25.0.w,
                        color: AppColors.kYellowNorColor,
                      ),
                    ),
                    label: cubit.layOutLabels[index],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
