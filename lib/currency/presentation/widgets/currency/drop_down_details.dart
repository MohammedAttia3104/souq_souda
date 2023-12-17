import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/widgets/cached_image.dart';
import 'package:souq_souda/currency/domain/entities/currency_entity.dart';
import 'package:souq_souda/currency/presentation/controllers/currency/currency_details_cubit.dart';

class DropDownDetails extends StatefulWidget {
  const DropDownDetails({super.key});

  @override
  State<DropDownDetails> createState() => _DropDownDetailsState();
}

class _DropDownDetailsState extends State<DropDownDetails> {
  SharedPreferences? prefs; // Declare SharedPreferences instance

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
    saveCurrencyId(21);
  }

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  void saveCurrencyId(int currencyId) async {
    if (prefs != null) {
      await prefs!.setInt("currencyId", currencyId);
      debugPrint("Setting currencyId $currencyId");
    }
  }
  int? bankId;

  void saveBankId(int bankId) async {
    if (prefs != null) {
      await prefs!.setInt("bankId", bankId);
      debugPrint("Setting bankId $bankId");
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrencyDetailsCubit, CurrencyDetailsState>(
      buildWhen: (previous, current) {
        return previous != current && current is CurrencyDetailsSuccessState;
      },
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CurrencyDetailsLoadingState) {
          SizedBox(
            height: 20.0.h,
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.kYellowNorColor,
              ),
            ),
          );
        }
        if (state is CurrencyDetailsSuccessState) {
          CurrencyEntity? currency = state.currencies[1];
          return SizedBox(
            height: 20.0.h,
            child: DropdownButtonFormField(
              value: currency,
              itemHeight: 30.h,
              elevation: 0,
              items: state.currencies.map<DropdownMenuItem<CurrencyEntity>>(
                (CurrencyEntity value) {
                  return DropdownMenuItem<CurrencyEntity>(
                    value: value,
                    child: Row(
                      children: [
                        CachedImage(
                          imagePath: ApiConstants.storageUrl(value.icon),
                          width: 20.0.w,
                          height: 20.0.h,
                        ),
                        SizedBox(
                          width: 8.0.w,
                        ),
                        Text(
                          value.name,
                          style: AppStyles.style10Bold,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
              onChanged: (CurrencyEntity? newValue) {
                setState(() {
                  currency = newValue;
                  saveCurrencyId(newValue!.id);
                  debugPrint("onChangedCurrencyValue${newValue.id}");
                });
              },
              decoration: InputDecoration(
                fillColor: AppColors.kWhiteColor,
                filled: true,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0.w),
              ),
            ),
          );
        }
        return SizedBox(
          height: 20.0.h,
          width: 20.0.w,
          child: const Center(
            child: CircularProgressIndicator(
              color: AppColors.kYellowNorColor,
            ),
          ),
        );
      },
    );
  }
}
