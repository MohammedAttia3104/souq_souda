import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/Registeration/presentation/screens/register/widgets/input_register_body.dart';
import 'package:souq_souda/Registeration/presentation/widgets/back_app_bar.dart';
import 'package:souq_souda/core/constants/app_strings.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 24.0.w,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackAppBar(
                  barTitle: AppStrings.createNewAccount,
                ),
                SizedBox(
                  height:30.0.h,
                ),
                const InputRegisterBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
