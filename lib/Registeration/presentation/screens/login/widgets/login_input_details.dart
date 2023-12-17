import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/Registeration/presentation/controllers/auth_cubit.dart';
import 'package:souq_souda/core/constants/app_assets.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/services/services_locator.dart';
import 'package:souq_souda/core/utils/validator.dart';
import 'package:souq_souda/core/widgets/Custom_text_form_field.dart';
import 'package:souq_souda/core/widgets/circular_indicator.dart';
import 'package:souq_souda/core/widgets/custom_text_button.dart';
import 'package:souq_souda/layout/screens/layout_screen.dart';

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
  final _formKey = GlobalKey<FormState>();

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
    return BlocProvider<AuthCubit>(
      create: (_) => sl<AuthCubit>(),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomTextFormField(
              controller: emailController,
              hintText: AppStrings.emailAddressHint,
              keyBoardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              validate: (value) =>
                  Validator.emailValidator(emailController.text),
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
              keyBoardType: TextInputType.visiblePassword,
              focusNode: passwordFocusNode,
              validate: (value) => Validator.passwordValidator(passwordController.text),
              onEditingComplete: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthCubit>().getAuthLogin(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                }
              },
              textInputAction: TextInputAction.done,
              isObscured: false,
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
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoginSuccessState) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LayOutScreen(),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoginLoadingState) {
                  return CircularIndicator(
                    height: 60.0.h,
                  );
                }
                if (state is AuthLoginErrorState) {
                  return Text(
                    state.error,
                  );
                }
                if (state is AuthLoginSuccessState) {
                  return CustomTextButton(
                      btnText: AppStrings.login,
                      onPressed: () {
                        context.read<AuthCubit>().getAuthLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                      });
                }
                return CustomTextButton(
                  btnText: AppStrings.login,
                  onPressed: () {
                    context.read<AuthCubit>().getAuthLogin(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
