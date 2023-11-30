import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_assets.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/currency/presentation/widgets/bank_and_black_market_price_container.dart';
import 'package:souq_souda/core/widgets/single_grid_item_details.dart';
import 'package:souq_souda/currency/presentation/widgets/currencies_chart.dart';
import 'package:souq_souda/currency/presentation/widgets/currency_app_bar.dart';
import 'package:souq_souda/currency/presentation/widgets/drop_down_details.dart';
import 'package:souq_souda/currency/presentation/widgets/how_much_in_black_market.dart';

import '../widgets/bank_item_grid_view.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  AppAssets.combinedShape,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: AppPadding.padding24w,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: AppPadding.padding48h,
                      ),
                      const CurrencyAppBar(),
                      SizedBox(
                        height: AppPadding.padding26h,
                      ),
                      const HowMuchInBlackMarket(),
                      SizedBox(
                        height: 25.0.h,
                      ),
                      const BankAndBlackMarketPriceContainer(),
                      SizedBox(
                        height: 25.0.h,
                      ),
                      const CurrenciesChart(),
                      SizedBox(
                        height: 25.0.h,
                      ),
                      const BankItemGridView(),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}