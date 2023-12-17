import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/services/services_locator.dart';
import 'package:souq_souda/core/widgets/circular_indicator.dart';
import 'package:souq_souda/core/widgets/single_grid_item_details.dart';

import '../../controllers/currency/currency_details_cubit.dart';

class BankItemGridView extends StatefulWidget {
  final double bankBuyPrice;
  final double bankSellPrice;

  const BankItemGridView({
    super.key,
    required this.bankBuyPrice,
    required this.bankSellPrice,
  });

  @override
  State<BankItemGridView> createState() => _BankItemGridViewState();
}

class _BankItemGridViewState extends State<BankItemGridView> {
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
    getCurrencyId();
    getBankId();
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

  // void saveBankId(int bankId) async {
  //   if (prefs != null) {
  //     await prefs!.setInt("bankId", bankId);
  //     debugPrint("Setting bankId $bankId");
  //   }
  // }

  Future<void> getBankId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? savedBankId = prefs.getInt("bankId");

    setState(() {
      bankId = savedBankId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CurrencyDetailsCubit>()..getBanks(),
      child: BlocBuilder<CurrencyDetailsCubit, CurrencyDetailsState>(
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
                    (index) {
                  return SingleGridItemDetails(
                    itemImagePath:
                    ApiConstants.storageUrl(state.banks[index].icon),
                    itemName: state.banks[index].name,
                    isFavoriteAvailable: true,
                    containerBackgroundColor:
                    state.banks[index].name == 'Central Bank of Egypt'
                        ? AppColors.kYellowNorColor
                        : AppColors.kGreyBehindColor,
                    sellAndPriceWidget: SellAndBuyPriceWidget(
                      buyPrice: 200.0,
                      sellPrice: 200.0,
                    ),
                  );
                },
              ),
            );
          }
          return CircularIndicator(
            height: 100.0.h,
          );
        },
      ),
    );
  }
}

// class BankPrices extends StatelessWidget {
//   final double bankBuyPrice;
//   final double bankSellPrice;
//
//   const BankPrices({
//     super.key,
//     required this.bankBuyPrice,
//     required this.bankSellPrice,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SellAndBuyPriceWidget(
//       buyPrice: bankBuyPrice,
//       sellPrice: bankSellPrice,
//     );
//   }
// }
// SharedPreferences? prefs; // Declare SharedPreferences instance
//
// @override
// void initState() {
//   super.initState();
//   initSharedPreferences();
//   getCurrencyId();
// }
//
// Future<void> initSharedPreferences() async {
//   prefs = await SharedPreferences.getInstance();
// }
//
// void saveBankId(int bankId) async {
//   if (prefs != null) {
//     await prefs!.setInt("bankId", bankId);
//     debugPrint("Setting bankId $bankId");
//   }
// }
//
// int? currencyId;
//
// Future<void> getCurrencyId() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   int? savedCurrencyId = prefs.getInt("currencyId");
//
//   setState(() {
//     currencyId = savedCurrencyId;
//   });
// }

// final double bankBuyPrice;
