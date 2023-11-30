import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:souq_souda/Registeration/presentation/screens/login/login_screen.dart';
import 'package:souq_souda/Registeration/presentation/screens/otp_confirm/otp_confirm_screen.dart';
import 'package:souq_souda/Registeration/presentation/screens/password_recovery/create_new_password.dart';
import 'package:souq_souda/Registeration/presentation/screens/password_recovery/password_recovery_screen.dart';
import 'package:souq_souda/Registeration/presentation/screens/register/register_screen.dart';
import 'package:souq_souda/Registeration/presentation/screens/success_confirm/success_confirm_screen.dart';
import 'package:souq_souda/config/routes/app_routes.dart';
import 'package:souq_souda/config/themes/app_themes.dart';
import 'package:souq_souda/core/bloc_observer.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/services/services_locator.dart';
import 'package:souq_souda/currency/presentation/controllers/currency_details_cubit.dart';
import 'package:souq_souda/gold/presentation/controllers/gold_cubit.dart';
import 'package:souq_souda/layout/controllers/layout_cubit.dart';
import 'package:souq_souda/layout/screens/layout_screen.dart';
import 'package:device_preview/device_preview.dart';

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
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) =>
      const MyApp(),
    ),
   // const MyApp(),
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
        BlocProvider<CurrencyDetailsCubit>(
          create: (_) => sl<CurrencyDetailsCubit>()
            ..getCurrencyDetails()
            ..getBanks(),
        ),
        BlocProvider<GoldCubit>(
          create: (_) => sl<GoldCubit>()..getGold(),
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
            locale: const Locale("ar"),
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
