import 'package:flutter/material.dart';
import 'package:souq_souda/core/constants/app_assets.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/utils/validator.dart';
import 'package:souq_souda/core/widgets/Custom_text_form_field.dart';
import 'package:souq_souda/core/widgets/custom_text_button.dart';

class PasswordRecoveryInputDetails extends StatefulWidget {
  const PasswordRecoveryInputDetails({super.key});

  @override
  State<PasswordRecoveryInputDetails> createState() => _PasswordRecoveryInputDetailsState();
}

class _PasswordRecoveryInputDetailsState extends State<PasswordRecoveryInputDetails> {
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: emailController,
          hintText: AppStrings.emailAddressHint,
          labelTxt: AppStrings.emailAddress,
          imageIcon: AppAssets.emailIconImage,
          textInputAction: TextInputAction.done,
          validate: (value) =>
              Validator.emailValidator(emailController.text),
          keyBoardType: TextInputType.emailAddress,
          onEditingComplete: () {},
        ),
        SizedBox(
          height: AppPadding.padding300h,
        ),
        CustomTextButton(
          btnText: AppStrings.continueTxt,
          onPressed: () {},
        ),
      ],
    );
  }
}
