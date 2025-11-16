import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_keys_localization.dart';
import '../../../../core/config/routes.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_snackbar.dart';
import '../../../../core/widgets/custom_welcome_message_container.dart';
import '../logic/auth_cubit.dart';
import 'custom_form_text_field.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return SafeArea(
      child: BlocConsumer<AuthCubit, AuthState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          if (state is ForgotPasswordError) {
            CustomSnackBar.show(
              context,
              message: state.errorMessage,
              backgroundColor: AppColors.error,
              icon: Icons.error,
            );
          }
          if (state is ForgotPasswordSuccess) {
            CustomSnackBar.show(
              context,
              message: AuthKeys.forgotPassword.tr(),
              backgroundColor: AppColors.success,
              icon: Icons.check,
            );
            GoRouter.of(context).go(AppRoutes.kSignInView);
          }
        },
        builder: (context, state) {
          final isLoading = state is ForgotPasswordLoading;

          return Stack(
            children: [
              CustomMessageContainer(
                width: width,
                height: height,
                message: AuthKeys.forgotPassword.tr(),
              ),
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: SizedBox(
                    height: height,
                    width: width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// 🔲 Added Container around the form
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(20.w),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                CustomTextFormField(
                                  hintText: AuthKeys.email.tr(),
                                  controller: _emailController,
                                  prefixIcon: Icons.email,
                                  validator: (value) {
                                    if (value != null &&
                                        value.isNotEmpty &&
                                        EmailValidator.validate(value)) {
                                      return null;
                                    } else {
                                      return AuthKeys.enterYourEmail.tr();
                                    }
                                  },
                                ),
                                SizedBox(height: height * 0.03),
                                CustomButton(
                                  isLoading: isLoading,
                                  text: AuthKeys.sendResetLink.tr(),
                                  width: width,
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      context
                                          .read<AuthCubit>()
                                          .sendPasswordResetEmail(
                                        _emailController.text.trim(),
                                      );
                                    } else {
                                      CustomSnackBar.show(
                                        context,
                                        message:
                                        AuthKeys.enterYourEmail.tr(),
                                        backgroundColor: AppColors.error,
                                        icon: Icons.error,
                                      );
                                    }
                                  },
                                  color: AppColors.primary,
                                ),
                                SizedBox(height: height * 0.03),
                                GestureDetector(
                                  onTap: () {
                                    GoRouter.of(context)
                                        .pushReplacement(AppRoutes.kSignInView);
                                  },
                                  child: Text(
                                    AuthKeys.logIn.tr(),
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ], 
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
