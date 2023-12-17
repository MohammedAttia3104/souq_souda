import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq_souda/core/constants/app_assets.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/services/services_locator.dart';
import 'package:souq_souda/currency/presentation/controllers/currency/currency_details_cubit.dart';
import 'package:souq_souda/currency/presentation/widgets/currency/bank_and_black_market_price_container.dart';
import 'package:souq_souda/currency/presentation/widgets/currency/currencies_chart.dart';
import 'package:souq_souda/currency/presentation/widgets/currency/currency_app_bar.dart';
import 'package:souq_souda/currency/presentation/widgets/currency/currency_chart.dart';
import 'package:souq_souda/currency/presentation/widgets/currency/currency_line_chart.dart';
import 'package:souq_souda/currency/presentation/widgets/how_much_in_black_market.dart';

import '../widgets/currency/bank_item_grid_view.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  SharedPreferences? prefs; // Declare SharedPreferences instance

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
    getCurrencyId();
  }

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  int? currencyId;

  Future<void> getCurrencyId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? savedCurrencyId = prefs.getInt("currencyId");

    setState(() {
      currencyId = savedCurrencyId;
    });
  }

  int? bankId;

  Future<void> getBankId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? savedBankId = prefs.getInt("bankId");

    setState(() {
      bankId = savedBankId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CurrencyDetailsCubit>(
      create: (_) => sl<CurrencyDetailsCubit>()
        ..getCurrencyDetails()
        ..getBanks(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    AppAssets.combinedShape,
                    height: 315.0.h,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
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
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25.0.h,
              ),
              const CurrenciesChart(),
              //const CurrencyLineChart(),
              //  const CurrencyChart(),
              SizedBox(
                height: 25.0.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 24.0.w,
                ),
                child: BlocBuilder<CurrencyDetailsCubit, CurrencyDetailsState>(
                  builder: (context, state) {
                    if (state is CurrencyDetailsSuccessState) {
                      return BankItemGridView(
                        bankBuyPrice: 220,
                        bankSellPrice: 200,
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
