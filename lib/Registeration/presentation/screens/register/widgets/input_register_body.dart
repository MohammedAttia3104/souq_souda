import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:souq_souda/Registeration/presentation/controllers/auth_cubit.dart';
import 'package:souq_souda/core/constants/app_assets.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/services/services_locator.dart';
import 'package:souq_souda/core/utils/validator.dart';
import 'package:souq_souda/core/widgets/Custom_text_form_field.dart';
import 'package:souq_souda/core/widgets/circular_indicator.dart';
import 'package:souq_souda/core/widgets/custom_text_button.dart';
import 'package:souq_souda/layout/screens/layout_screen.dart';

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
  final _key = GlobalKey<FormState>();
  static const storage = FlutterSecureStorage();

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
    return BlocProvider<AuthCubit>(
      create: (_) => sl<AuthCubit>(),
      child: Column(
        children: [
          CustomTextFormField(
            controller: nameController,
            focusNode: nameFocusNode,
            hintText: AppStrings.fullNameHint,
            labelTxt: AppStrings.fullName,
            textInputAction: TextInputAction.next,
            validate: (value) {
              return Validator.nameValidator(nameController.text);
            },
            keyBoardType: TextInputType.name,
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(emailFocusNode);
            },
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
            validate: (value) {
              return Validator.emailValidator(emailController.text);
            },
            keyBoardType: TextInputType.emailAddress,
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(passwordFocusNode);
            },
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
            validate: (value) {
              return Validator.passwordValidator(passwordController.text);
            },
            keyBoardType: TextInputType.visiblePassword,
            isObscured: false,
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(confirmPasswordFocusNode);
            },
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
            validate: (value) {
              return Validator.confirmPasswordValidator(
                confirmPasswordController.text,
              );
            },
            keyBoardType: TextInputType.visiblePassword,
            isObscured: true,
            onEditingComplete: () {
              if (_key.currentState!.validate()) {
                context.read<AuthCubit>().getAuthRegister(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      confirmPassword: confirmPasswordController.text,
                    );
              }
            },
            imageIcon: AppAssets.lockIconImage,
          ),
          SizedBox(
            height: AppPadding.padding100h,
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) async {

              if (state is AuthRegisterSuccessState) {
                await storage.write(key: 'token', value: state.user.token);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LayOutScreen(),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthRegisterLoadingState) {
                return CircularIndicator(height: 60.0.h);
              }
              if (state is AuthRegisterErrorState) {
                return Text(state.error);
              }
              if (state is AuthRegisterSuccessState) {
                return CustomTextButton(
                  btnText: AppStrings.nextBtnText,
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      context.read<AuthCubit>().getAuthRegister(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text,
                          );
                    }
                  },
                );
              }
              return CustomTextButton(
                btnText: AppStrings.nextBtnText,
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    context.read<AuthCubit>().getAuthRegister(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                        );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
