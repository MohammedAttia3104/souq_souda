import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_chart/charts/line-chart.widget.dart';
import 'package:line_chart/model/line-chart.model.dart';
import 'package:souq_souda/core/services/services_locator.dart';
import 'package:souq_souda/core/widgets/circular_indicator.dart';
import 'package:souq_souda/currency/presentation/controllers/currency/currency_details_cubit.dart';

class CurrencyLineChart extends StatefulWidget {
  const CurrencyLineChart({super.key});

  @override
  State<CurrencyLineChart> createState() => _CurrencyLineChartState();
}

class _CurrencyLineChartState extends State<CurrencyLineChart> {

  @override
  Widget build(BuildContext context) {
    Paint circlePaint = Paint()..color = Colors.black;

    Paint insideCirclePaint = Paint()..color = Colors.white;

    Paint linePaint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..color = Colors.red;

    return BlocProvider<CurrencyDetailsCubit>(
      create: (context) {
        return sl<CurrencyDetailsCubit>()
          ..drawLiveCurrencyChart(
            startDate: DateTime(2023, 10, 20),
            //type: 'live',
          );
      },
      child: BlocBuilder<CurrencyDetailsCubit, CurrencyDetailsState>(
        builder: (context, state) {
          if (state is CurrencyChartSuccessState) {
            return LineChart(
              width: MediaQuery.sizeOf(context).width,
              height: 180,
              data: List.generate(state.currencyFilteredData.length, (index) {
                String apiDateString = state.currencyFilteredData[index].date;
                DateTime apiDate = DateTime.parse(apiDateString);

                return LineChartModel(
                  amount: state.currencyFilteredData[index].price,
                  date: DateTime(apiDate.millisecondsSinceEpoch),
                );
              }),
              linePaint: linePaint,
              circlePaint: circlePaint,
              showPointer: true,
              showCircles: true,
              customDraw: (Canvas canvas, Size size) {},
              linePointerDecoration: const BoxDecoration(
                color: Colors.white,
              ),
              pointerDecoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              insideCirclePaint: insideCirclePaint,
              onValuePointer: (LineChartModelCallback value) {
                print('${value.chart} ${value.percentage}');
              },
              onDropPointer: () {
                print('onDropPointer');
              },
              insidePadding: 16,
            );
          }
          return CircularIndicator(
            height: 70.0.h,
          );
        },
      ),
    );
  }
}
