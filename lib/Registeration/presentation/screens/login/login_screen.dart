import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/Registeration/presentation/screens/login/widgets/continue_with_google.dart';
import 'package:souq_souda/Registeration/presentation/screens/login/widgets/login_input_details.dart';
import 'package:souq_souda/Registeration/presentation/screens/login/widgets/login_to_text_widget.dart';
import 'package:souq_souda/Registeration/presentation/screens/login/widgets/or_login_with.dart';
import 'package:souq_souda/core/constants/app_assets.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/widgets/custom_text_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const LoginToTextWidget(),
                  SizedBox(
                    height: AppPadding.padding50h,
                  ),
                  const LoginInputDetails(),
                  SizedBox(
                    height: AppPadding.padding20h,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.doNotHaveAnAccount,
                          style: AppStyles.style12Bold.copyWith(
                            color: AppColors.kGreyNorColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            AppStrings.createAccount,
                            style: AppStyles.style12Bold.copyWith(
                              color: AppColors.kYellowLightColor,
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppPadding.padding32h,
                  ),
                  const OrLoginWith(),
                  SizedBox(
                    height: AppPadding.padding32h,
                  ),
                  const ContinueWithGoogle(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
