import 'package:flutter/material.dart';
import 'package:souq_souda/core/constants/app_assets.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/utils/validator.dart';
import 'package:souq_souda/core/widgets/Custom_text_form_field.dart';
import 'package:souq_souda/core/widgets/custom_text_button.dart';

class InputRegisterBody extends StatefulWidget {
  const InputRegisterBody({super.key});

  @override
  State<InputRegisterBody> createState() => _InputRegisterBodyState();
}

class _InputRegisterBodyState extends State<InputRegisterBody> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late FocusNode nameFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;

  // late UserEntity user;

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
    // user = UserEntity(
    //   name: nameController.text,
    //   email: emailController.text,
    //   password: passwordController.text,
    //   confirmPassword: confirmPasswordController.text,
    // );
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
    return Column(
      children: [
        CustomTextFormField(
          controller: nameController,
          focusNode: nameFocusNode,
          hintText: AppStrings.fullNameHint,
          labelTxt: AppStrings.fullName,
          textInputAction: TextInputAction.next,
          validate: (value) => Validator.nameValidator(nameController.text),
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
          validate: (value) => Validator.emailValidator(emailController.text),
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
          onEditingComplete: () =>
              FocusScope.of(context).requestFocus(confirmPasswordFocusNode),
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
          validate: (value) => Validator.confirmPasswordValidator(
              confirmPasswordController.text),
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
    );
  }
}
