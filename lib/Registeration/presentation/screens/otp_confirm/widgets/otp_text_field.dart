import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/utils/validator.dart';

class OTPInput extends StatelessWidget {
  OTPInput({
    super.key,
    required this.autoFocus,
    required this.controller,
    this.onEditingComplete,
  });

  final bool autoFocus;
  final TextEditingController controller;
  void Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.0.h,
      width: 65.0.w,
      child: TextFormField(
        autofocus: autoFocus,
        keyboardType: TextInputType.number,
        onTapOutside: (event) =>
            FocusManager.instance.primaryFocus?.unfocus(),
        textAlign: TextAlign.center,
        maxLength: 1,
        controller: controller,
        style: TextStyle(
          color: AppColors.kWhiteColor,
          fontSize: 18.0.sp,
        ),
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
               10.0.r,
              ),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10.0.r,
              ),
            ),
            borderSide: const BorderSide(
              color: AppColors.kYellowNorColor,
            ),
          ),
          // hintText: '*',
          // hintStyle: TextStyle(
          //   color: AppColors.kWhiteColor,
          //   fontSize: 15.0.sp,
          // ),
          counterText: '',
          filled: true,
          fillColor: AppColors.kGreyBehindColor,
        ),
        validator: (value) => Validator.otpValidator(controller.text),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        onEditingComplete: onEditingComplete,
      ),
    );
  }
}

///TODO: Error Border Needed to Handle
// enabledBorder: OutlineInputBorder(
//   borderRadius: BorderRadius.all(
//     Radius.circular(
//       10.0.r,
//     ),
//   ),
//   borderSide:  BorderSide(
//     color: AppColors.kYellowNorColor,
//     width: 0.5.w,
//   ),
// ),
// errorBorder: OutlineInputBorder(
//   borderRadius: BorderRadius.all(
//     Radius.circular(
//       10.0.r,
//     ),
//   ),
//   borderSide:  BorderSide(
//     color: Colors.red,
//     width: 0.5.w,
//   ),
// ),
// focusedErrorBorder: OutlineInputBorder(
//   borderRadius: BorderRadius.all(
//     Radius.circular(
//       10.0.r,
//     ),
//   ),
//   borderSide: BorderSide(
//     color: Colors.red,
//     width: 0.5.w,
//   ),
// ),
