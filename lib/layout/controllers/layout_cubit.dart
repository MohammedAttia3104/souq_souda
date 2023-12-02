import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq_souda/core/constants/app_assets.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/currency/presentation/screens/currency_screen.dart';
import 'package:souq_souda/gold/presentation/screens/gold_screen.dart';
import 'package:souq_souda/love/presentation/screens/love_screen.dart';
import 'package:souq_souda/profile/presentation/screens/profile_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  // Color activeImageColor = AppColors.kYellowNorColor;
  // Color inActiveImageColor = AppColors.kBlackHovColor;
  //
  // void changeImageColor(Color inActiveImageColor){
  //
  // }
  void changeBottomNavBar(index) {
    currentIndex = index;
    emit(LayOutChangeBottomNavState());
  }

  List<String> layOutLabels = [
    AppStrings.currencyLabel,
    AppStrings.goldLabel,
    AppStrings.loveLabel,
    AppStrings.profileLabel,
  ];

  List<String> layOutIcons = [
    AppAssets.currencyIconImage,
    AppAssets.goldIconImage,
    AppAssets.loveIconImage,
    AppAssets.profileIconImage,
  ];

  List<Widget> layOutScreens = const [
    CurrencyScreen(),
    GoldScreen(),
    LoveScreen(),
    ProfileScreen(),
  ];
}
