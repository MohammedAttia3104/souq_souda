import 'package:flutter/material.dart';
import 'package:souq_souda/Registeration/presentation/screens/otp_confirm/widgets/otp_input_details.dart';
import 'package:souq_souda/Registeration/presentation/widgets/back_app_bar.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';

class OtpConfirmScreen extends StatelessWidget {
  const OtpConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.padding24w,
          ),
          child: Column(
            children: [
              const BackAppBar(
                barTitle: AppStrings.passwordRecovery,
              ),
              SizedBox(
                height: AppPadding.padding60h,
              ),
              Text(
                AppStrings.enterSentCode,
                style: AppStyles.style18Bold,
              ),
              SizedBox(
                height: AppPadding.padding18h,
              ),
              Text(
                AppStrings.codeSendTo,
                style: AppStyles.style12Nor.copyWith(
                  color: AppColors.kYellowLightHovColor,
                ),
              ),
              Text(
                AppStrings.codeSendToEmail,
                style: AppStyles.style12Nor.copyWith(
                  color: AppColors.kYellowNorColor,
                ),
              ),
              SizedBox(
                height: AppPadding.padding32h,
              ),
              const OTPInputDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
