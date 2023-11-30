import 'package:flutter/material.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';

class LoginToTextWidget extends StatelessWidget {
  const LoginToTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppPadding.padding120h,
      child: Center(
        child: Text(
          AppStrings.loginWithYourMail,
          style: AppStyles.style26Bold,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
