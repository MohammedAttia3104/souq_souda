import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/services/services_locator.dart';
import 'package:souq_souda/core/widgets/circular_indicator.dart';
import 'package:souq_souda/currency/presentation/controllers/currency/currency_details_cubit.dart';

class CurrenciesChart extends StatefulWidget {
  const CurrenciesChart({super.key});

  @override
  State<CurrenciesChart> createState() => _CurrenciesChartState();
}

class _CurrenciesChartState extends State<CurrenciesChart> {
  List<Color> gradientColors = [
    AppColors.contentColorCyan,
    AppColors.contentColorBlue,
  ];

  bool showAvg = false;
  SharedPreferences? prefs; // Declare SharedPreferences instance
  int? currencyId;
  @override
  void initState() {
    super.initState();
    initSharedPreferences();
    setState(() {
      getCurrencyId();
    });
  }

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> getCurrencyId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int savedCurrencyId = prefs.getInt("currencyId")!;
    debugPrint(savedCurrencyId.toString());
    setState(() {
      currencyId = savedCurrencyId;
    });
  }



  @override
  Widget build(BuildContext context) {
    var currencyId  = context.read<CurrencyDetailsCubit>().currencyEntity?.id;

    return BlocProvider<CurrencyDetailsCubit>(
      create: (context) {
        return sl<CurrencyDetailsCubit>()
          ..drawLiveCurrencyChart(
            startDate: DateTime(2023, 12, 05),
          );
      },
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 18,
                left: 12,
                top: 24,
                bottom: 12,
              ),
              child:  BlocBuilder<CurrencyDetailsCubit, CurrencyDetailsState>(
                builder: (context, state) {
                  if (state is CurrencyChartSuccessState) {
                    return LineChart(
                      showAvg
                          ? LineChartData(
                              lineTouchData:
                                  const LineTouchData(enabled: false),
                              gridData: FlGridData(
                                show: false,
                                drawHorizontalLine: true,
                                verticalInterval: 1,
                                horizontalInterval: 1,
                                getDrawingVerticalLine: (value) {
                                  return const FlLine(
                                    color: Color(0xff37434d),
                                    strokeWidth: 1,
                                  );
                                },
                                getDrawingHorizontalLine: (value) {
                                  return const FlLine(
                                    color: Color(0xff37434d),
                                    strokeWidth: 1,
                                  );
                                },
                              ),
                              titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 30,
                                    getTitlesWidget: bottomTitleWidgets,
                                    interval: 1,
                                  ),
                                ),
                                leftTitles: const AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                    // getTitlesWidget: leftTitleWidgets,
                                    reservedSize: 42,
                                    interval: 1,
                                  ),
                                ),
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: true,
                                border:
                                    Border.all(color: const Color(0xff37434d)),
                              ),
                              minX: 0,
                              maxX: 13,
                              minY: state.currencyFilteredData[0].price
                                  .floorToDouble(),
                              maxY: state.currencyFilteredData[0].price
                                  .ceilToDouble(),
                              lineBarsData: [
                                LineChartBarData(
                                  ///ToDo : 1
                                  spots: List.generate(
                                      state.currencyFilteredData.length,
                                      (index) {
                                    String apiDateString =
                                        state.currencyFilteredData[index].date;
                                    DateTime apiDate =
                                        DateTime.parse(apiDateString);

                                    return FlSpot(
                                      apiDate.day.toDouble(),
                                      state.currencyFilteredData[index].price,
                                    );
                                  }),
                                  isCurved: true,
                                  gradient: LinearGradient(
                                    colors: [
                                      ColorTween(
                                              begin: gradientColors[0],
                                              end: gradientColors[1])
                                          .lerp(0.2)!,
                                      ColorTween(
                                              begin: gradientColors[0],
                                              end: gradientColors[1])
                                          .lerp(0.2)!,
                                    ],
                                  ),
                                  barWidth: 5,
                                  isStrokeCapRound: true,
                                  dotData: const FlDotData(
                                    show: false,
                                  ),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    gradient: LinearGradient(
                                      colors: [
                                        ColorTween(
                                                begin: gradientColors[0],
                                                end: gradientColors[1])
                                            .lerp(0.2)!
                                            .withOpacity(0.1),
                                        ColorTween(
                                                begin: gradientColors[0],
                                                end: gradientColors[1])
                                            .lerp(0.2)!
                                            .withOpacity(0.1),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : LineChartData(
                              gridData: FlGridData(
                                show: true,
                                drawHorizontalLine: false,
                                drawVerticalLine: true,
                                horizontalInterval: 1,
                                verticalInterval: 1,
                                getDrawingHorizontalLine: (value) {
                                  return const FlLine(
                                    color: AppColors.kYellowLightActColor,
                                    strokeWidth: 1,
                                  );
                                },
                                getDrawingVerticalLine: (value) {
                                  return FlLine(
                                    color: value % 2 != 0
                                        ? AppColors.kYellowLightActColor
                                        : AppColors.kBlackLightActColor,
                                    strokeWidth: 1,
                                  );
                                },
                              ),
                              titlesData: FlTitlesData(
                                show: true,
                                rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 30,
                                    interval: 1,
                                    getTitlesWidget: bottomTitleWidgets,
                                  ),
                                ),
                                leftTitles: const AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                    interval: 1,
                                    reservedSize: 42,
                                  ),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: false,
                                border:
                                    Border.all(color: const Color(0xff37434d)),
                              ),
                              minX: 0,
                              maxX: 11,
                              minY: 0,
                              maxY: 100,
                              lineBarsData: [
                                ///ToDo : 2
                                LineChartBarData(
                                  spots: List.generate(
                                      state.currencyFilteredData.length,
                                      (index) {
                                    String apiDateString =
                                        state.currencyFilteredData[index].date;
                                    DateTime apiDate =
                                        DateTime.parse(apiDateString);

                                    return FlSpot(
                                      apiDate.day.toDouble(),
                                      state.currencyFilteredData[index].price,
                                    );
                                  }),
                                  isCurved: true,
                                  gradient: LinearGradient(
                                    colors: gradientColors,
                                  ),
                                  barWidth: 5,
                                  isStrokeCapRound: true,
                                  dotData: const FlDotData(
                                    show: false,
                                  ),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    gradient: LinearGradient(
                                      colors: gradientColors
                                          .map(
                                              (color) => color.withOpacity(0.3))
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    );
                  }
                  return CircularIndicator(height: 50.0.h);
                },
              ),
            ),
          ),
          SizedBox(
            width: 60,
            height: 34,
            child: TextButton(
              onPressed: () {
                setState(() {
                  showAvg = !showAvg;
                });
              },
              child: Text(
                'avg',
                style: TextStyle(
                  fontSize: 12,
                  color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = const TextStyle(
      color: AppColors.kWhiteColor,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('سبت', style: style);
        break;
      case 3:
        text = Text('حد', style: style);
        break;
      case 5:
        text = Text('اتنين', style: style);
        break;
      case 7:
        text = Text('ثلاثاء', style: style);
        break;
      case 9:
        text = Text('اربع', style: style);
        break;
      case 11:
        text = Text('خميس', style: style);
        break;
      case 13:
        text = Text('جمعة', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
