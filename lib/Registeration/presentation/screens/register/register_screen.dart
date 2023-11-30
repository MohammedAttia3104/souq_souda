import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/Registeration/presentation/widgets/back_app_bar.dart';
import 'package:souq_souda/core/constants/app_assets.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/utils/validator.dart';
import 'package:souq_souda/core/widgets/Custom_text_form_field.dart';
import 'package:souq_souda/core/widgets/custom_text_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late FocusNode nameFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    nameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

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
                const BackAppBar(
                  barTitle: AppStrings.createNewAccount,
                ),
                SizedBox(
                  height: AppPadding.padding50h,
                ),
                CustomTextFormField(
                  controller: nameController,
                  focusNode: nameFocusNode,
                  hintText: AppStrings.fullNameHint,
                  labelTxt: AppStrings.fullName,
                  textInputAction: TextInputAction.next,
                  validate: (value) =>
                      Validator.nameValidator(nameController.text),
                  keyBoardType: TextInputType.name,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(emailFocusNode),
                  imageIcon: AppAssets.profileIconImage,
                ),
                SizedBox(
                  height: AppPadding.padding24h,
                ),
                CustomTextFormField(
                  controller: emailController,
                  focusNode: emailFocusNode,
                  hintText: AppStrings.emailAddressHint,
                  labelTxt: AppStrings.emailAddress,
                  validate: (value) =>
                      Validator.emailValidator(emailController.text),
                  keyBoardType: TextInputType.emailAddress,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(passwordFocusNode),
                  imageIcon: AppAssets.emailIconImage,
                ),
                SizedBox(
                  height: AppPadding.padding24h,
                ),
                CustomTextFormField(
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  hintText: AppStrings.passwordHint,
                  labelTxt: AppStrings.password,
                  validate: (value) =>
                      Validator.passwordValidator(passwordController.text),
                  keyBoardType: TextInputType.visiblePassword,
                  isObscured: true,
                  onEditingComplete: () => FocusScope.of(context)
                      .requestFocus(confirmPasswordFocusNode),
                  imageIcon: AppAssets.lockIconImage,
                ),
                SizedBox(
                  height: AppPadding.padding24h,
                ),
                CustomTextFormField(
                  controller: confirmPasswordController,
                  focusNode: confirmPasswordFocusNode,
                  hintText: AppStrings.passwordHint,
                  labelTxt: AppStrings.confirmPassword,
                  textInputAction: TextInputAction.done,
                  validate: (value) =>
                      Validator.confirmPasswordValidator(confirmPasswordController.text),
                  keyBoardType: TextInputType.visiblePassword,
                  isObscured: true,
                  onEditingComplete: () {},
                  imageIcon: AppAssets.lockIconImage,
                ),
                SizedBox(
                  height: AppPadding.padding100h,
                ),
                CustomTextButton(
                  btnText: AppStrings.nextBtnText,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
