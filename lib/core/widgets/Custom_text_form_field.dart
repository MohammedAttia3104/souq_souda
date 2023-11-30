import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.controller,
    this.validate,
    this.keyBoardType,
    this.onEditingComplete,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.isObscured = false,
    required this.hintText,
    required this.labelTxt,
    required this.imageIcon,
  });

  bool isObscured;
  final String hintText;
  final String labelTxt;
  final String imageIcon;
  final TextEditingController controller;
  final FormFieldValidator<String>? validate;
  final TextInputType? keyBoardType;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: 16.0.w,
              ),
              child: Text(
                labelTxt,
                style: AppStyles.style14Bold,
              ),
            ),
          ),
          SizedBox(
            height: AppPadding.padding8h,
          ),
          TextFormField(
            textDirection: TextDirection.rtl,
            controller: controller,
            keyboardType: keyBoardType,
            focusNode: focusNode,
            onEditingComplete: () {},
            style: AppStyles.txtFieldInputStyle,
            textInputAction: textInputAction,
            onChanged: (value) => debugPrint("onChanged : $value"),
            onSaved: (value) => debugPrint("onSaved : $value"),
            validator: validate,
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            decoration: InputDecoration(
              hintText: hintText,
              hintTextDirection: TextDirection.rtl,
              prefixIconConstraints: BoxConstraints(
                maxHeight: 35.0.h,
                maxWidth: 35.0.w,
              ),
              prefixIcon: Padding(
                padding:  EdgeInsets.only(left: 16.0.w),
                child: Image.asset(
                  imageIcon,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
