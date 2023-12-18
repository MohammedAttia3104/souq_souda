import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:souq_souda/core/services/services_locator.dart';
import 'package:souq_souda/currency/presentation/controllers/currency/currency_details_cubit.dart';

class CurrencyChart extends StatelessWidget {
  const CurrencyChart({super.key});

  @override
  Widget build(BuildContext context) {
    List<TimeData> timeDataList = [
      TimeData(domain: DateTime(2023, 8, 26), measure: 3),
      TimeData(domain: DateTime(2023, 8, 27), measure: 5),
      TimeData(domain: DateTime(2023, 8, 29), measure: 9),
      TimeData(domain: DateTime(2023, 9, 1), measure: 6.5),
    ];

    final timeGroupList = [
      TimeGroup(
        id: '1',
        data: timeDataList,
      ),
    ];

    return BlocProvider<CurrencyDetailsCubit>(
      create: (_) => sl<CurrencyDetailsCubit>()
        ..drawLiveCurrencyChart(
          startDate: DateTime(2023, 12, 10),
        ),
      child: BlocBuilder<CurrencyDetailsCubit, CurrencyDetailsState>(
        builder: (context, state) {
          if (state is CurrencyChartSuccessState) {
            return AspectRatio(
              aspectRatio: 16 / 9,
              child: DChartLineT(
                groupList: [
                  TimeGroup(
                    id: '1',
                    data: List.generate(state.currencyFilteredData.length,
                        (index) {
                      String apiDateString =
                          state.currencyFilteredData[index].date;
                      DateTime apiDate = DateTime.parse(apiDateString);
                      return TimeData(
                        domain: DateTime(apiDate.millisecondsSinceEpoch),
                        measure: state.currencyFilteredData[index].price,
                      );
                    }),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
