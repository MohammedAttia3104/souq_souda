import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_assets.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/gold/presentation/controllers/gold/gold_cubit.dart';
import 'package:souq_souda/gold/presentation/screens/coins_body.dart';
import 'package:souq_souda/gold/presentation/widgets/gold_grid_view.dart';
import 'package:souq_souda/gold/presentation/widgets/gold_screen_tab_bar.dart';
import 'package:souq_souda/gold/presentation/screens/ingots_body.dart';

import '../../../core/services/services_locator.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  TabBar get _tabs {
    return const TabBar(
      tabs: [
        Text(AppStrings.coins),
        Text(AppStrings.ingots),
        Text(AppStrings.goldLabel),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GoldCubit>(
      create: (context) => sl<GoldCubit>()..getGold(),
  child: DefaultTabController(
      length: 3,
      initialIndex: 2,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          end: AppPadding.padding24w,
          start: AppPadding.padding24w,
          bottom: AppPadding.padding5h,
        ),
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 106.0.h,
            leading: Padding(
              padding: EdgeInsetsDirectional.only(start: 14.0.w),
              child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  AppAssets.calculateIcon,
                  fit: BoxFit.contain,
                  height: 23.0.h,
                  width: 23.0.w,
                ),
              ),
            ),
            centerTitle: true,
            title: Text(
              AppStrings.goldLabel,
              style: AppStyles.style18Bold,
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: _tabs.preferredSize,
              child: const GoldTabBar(),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 24.0.h),
            child: const TabBarView(
              children: [
                ///ToDo:Coins
                CoinsBody(),
                ///ToDo:Ingots
                IngotsBody(),
                ///ToDo:Gold
                GoldGridViewBody(),
              ],
            ),
          ),
        ),
      ),
    ),
);
  }
}

///ToDo: Leading icon in the start of app bar without padding
