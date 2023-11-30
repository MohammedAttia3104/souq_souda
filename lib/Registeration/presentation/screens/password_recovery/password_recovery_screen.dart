import 'package:flutter/material.dart';
import 'package:souq_souda/Registeration/presentation/screens/password_recovery/widgets/password_recovery_input_details.dart';
import 'package:souq_souda/Registeration/presentation/widgets/back_app_bar.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'widgets/password_recovery_info.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({super.key});

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
                height: AppPadding.padding70h,
              ),
              const PasswordRecoveryInfo(),
              SizedBox(
                height: AppPadding.padding32h,
              ),
              const PasswordRecoveryInputDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
