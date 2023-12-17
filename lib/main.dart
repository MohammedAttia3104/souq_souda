import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/Registeration/presentation/screens/login/login_screen.dart';
import 'package:souq_souda/Registeration/presentation/screens/register/register_screen.dart';
import 'package:souq_souda/article/presentation/controllers/article/article_cubit.dart';
import 'package:souq_souda/config/routes/app_routes.dart';
import 'package:souq_souda/config/themes/app_themes.dart';
import 'package:souq_souda/core/bloc_observer.dart';
import 'package:souq_souda/core/services/services_locator.dart';
import 'package:souq_souda/currency/presentation/controllers/currency/currency_details_cubit.dart';
import 'package:souq_souda/currency/presentation/widgets/currency/currencies_chart.dart';
import 'package:souq_souda/gold/presentation/controllers/company/company_cubit.dart';
import 'package:souq_souda/gold/presentation/controllers/gold/gold_cubit.dart';
import 'package:souq_souda/gold/presentation/controllers/ingots_and_coins/ingots_and_coins_cubit.dart';
import 'package:souq_souda/layout/controllers/layout_cubit.dart';
import 'package:souq_souda/layout/screens/layout_screen.dart';

import 'article/presentation/screens/all_notification_screen.dart';
import 'gold/presentation/screens/test_two_screen.dart';

void main() async {
  // final dio = Dio()
  //   ..interceptors.add(PrettyDioLogger(
  //     requestHeader: true,
  //     requestBody: true,
  //     responseBody: true,
  //     responseHeader: false,
  //     compact: false,
  //   ));
  //
  // try {
  //   await dio.get(ApiConstants.currencyPath);
  // } catch (e) {
  //   print(e);
  // }
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) =>
    //   const MyApp(),
    // ),
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LayoutCubit>(
          create: (_) => LayoutCubit(),
        ),
        BlocProvider<CompanyCubit>(
          create: (_) => sl<CompanyCubit>()..getCompanies(),
        ),
        BlocProvider<IngotsAndCoinsCubit>(
          create: (_) => sl<IngotsAndCoinsCubit>()
            ..getIngots()
            //..getCoins(),
        ),
        BlocProvider<ArticleCubit>(
          create: (_) => sl<ArticleCubit>()..getArticlesData(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            // useInheritedMediaQuery: true,
            // locale: DevicePreview.locale(context),
            // builder: DevicePreview.appBuilder,
            //locale: const Locale("ar"),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.generateRoute,
            theme: AppThemes.appTheme,
            home: child,
          );
        },
        child: const LayOutScreen(),
      ),
    );
  }
}
