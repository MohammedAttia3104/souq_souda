import 'package:flutter/material.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';

class LoveScreen extends StatelessWidget {
  const LoveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          AppStrings.loveLabel,
          style: AppStyles.style18Bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: AppPadding.padding24w,
            end: AppPadding.padding24w,
            top: AppPadding.padding24h,
          ),
          // child: const BankItemGridView(),
        ),
      ),
    );
  }
}
