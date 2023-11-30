import 'package:flutter/material.dart';
import 'package:souq_souda/core/constants/app_assets.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/utils/validator.dart';
import 'package:souq_souda/core/widgets/Custom_text_form_field.dart';
import 'package:souq_souda/core/widgets/custom_text_button.dart';

class LoginInputDetails extends StatefulWidget {
  const LoginInputDetails({super.key});

  @override
  State<LoginInputDetails> createState() => _LoginInputDetailsState();
}

class _LoginInputDetailsState extends State<LoginInputDetails> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomTextFormField(
          controller: emailController,
          hintText: AppStrings.emailAddressHint,
          // imageIcon: AppAssets.emailIconImage,
          keyBoardType: TextInputType.emailAddress,
          focusNode: emailFocusNode,
          validate: (value) => Validator.emailValidator(emailController.text),
          onEditingComplete: () =>
              FocusScope.of(context).requestFocus(passwordFocusNode),
          labelTxt: AppStrings.emailAddress,
          imageIcon: AppAssets.emailIconImage,
        ),
        SizedBox(
          height: AppPadding.padding24h,
        ),
        CustomTextFormField(
          controller: passwordController,
          hintText: AppStrings.passwordHint,
          // imageIcon: AppAssets.lockIconImage,
          keyBoardType: TextInputType.visiblePassword,
          focusNode: passwordFocusNode,
          validate: (value) => Validator.passwordValidator(value),
          onEditingComplete: () {},
          textInputAction: TextInputAction.done,
          isObscured: true,
          labelTxt: AppStrings.password,
          imageIcon: AppAssets.lockIconImage,
        ),
        SizedBox(
          height: AppPadding.padding18h,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Checkbox(
                shape: const CircleBorder(),
                value: isChecked,
                onChanged: (value) {
                  isChecked != isChecked;
                },
              ),
              Text(
                AppStrings.rememberMe,
                style: AppStyles.style14Bold,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.didYouForgetPassword,
                  style: AppStyles.style14Bold.copyWith(
                    color: AppColors.kYellowLightActColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppPadding.padding32h,
        ),
        CustomTextButton(
          btnText: AppStrings.login,
          onPressed: () {},
        ),
      ],
    );
  }
}
