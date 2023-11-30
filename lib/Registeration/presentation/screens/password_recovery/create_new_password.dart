import 'package:flutter/material.dart';
import 'package:souq_souda/Registeration/presentation/widgets/back_app_bar.dart';
import 'package:souq_souda/core/constants/app_assets.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/utils/validator.dart';
import 'package:souq_souda/core/widgets/Custom_text_form_field.dart';
import 'package:souq_souda/core/widgets/custom_text_button.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    confirmPasswordController.dispose();
    confirmPasswordFocusNode.dispose();
  }

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
                barTitle: AppStrings.createNewPassword,
              ),
              SizedBox(
                height: AppPadding.padding60h,
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
                validate: (value) => Validator.confirmPasswordValidator(
                    confirmPasswordController.text),
                keyBoardType: TextInputType.visiblePassword,
                isObscured: true,
                onEditingComplete: () {},
                imageIcon: AppAssets.lockIconImage,
              ),
              SizedBox(
                height: AppPadding.padding322h,
              ),
              CustomTextButton(
                btnText: AppStrings.continueTxt,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
