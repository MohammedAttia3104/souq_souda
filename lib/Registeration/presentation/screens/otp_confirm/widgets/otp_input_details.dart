import 'package:flutter/material.dart';
import 'package:souq_souda/Registeration/presentation/screens/otp_confirm/widgets/do_not_receive_code.dart';
import 'package:souq_souda/Registeration/presentation/screens/otp_confirm/widgets/otp_text_field.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/widgets/custom_text_button.dart';

class OTPInputDetails extends StatefulWidget {
  const OTPInputDetails({super.key});

  @override
  State<OTPInputDetails> createState() => _OTPInputDetailsState();
}

class _OTPInputDetailsState extends State<OTPInputDetails> {
  TextEditingController otpFieldOne = TextEditingController();
  TextEditingController otpFieldTwo = TextEditingController();
  TextEditingController otpFieldThree = TextEditingController();
  TextEditingController otpFieldFour = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    otpFieldOne = TextEditingController();
    otpFieldTwo = TextEditingController();
    otpFieldThree = TextEditingController();
    otpFieldFour = TextEditingController();
    // AppConstants.smsCodeVer = otpFieldOne.text +
    //     otpFieldTwo.text +
    //     otpFieldThree.text +
    //     otpFieldFour.text +
    //     otpFieldFive.text +
    //     otpFieldSix.text;
  }

  @override
  void dispose() {
    super.dispose();
    otpFieldFour.dispose();
    otpFieldThree.dispose();
    otpFieldTwo.dispose();
    otpFieldOne.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OTPInput(
                autoFocus: false,
                controller: otpFieldOne,
              ),
              OTPInput(
                autoFocus: false,
                controller: otpFieldTwo,
              ),
              OTPInput(
                autoFocus: false,
                controller: otpFieldThree,
              ),
              OTPInput(
                autoFocus: false,
                controller: otpFieldFour,
              ),
            ],
          ),
          const DoNotReceiveCode(),
          CustomTextButton(
            btnText: AppStrings.continueTxt,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
