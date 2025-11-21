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
            GoRouter.of(context).pop();
          }
        },
        builder: (context, state) {
          final isLoading = state is ForgotPasswordLoading;

          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  /// 🔵 Top header background (same as screenshot)
                  Container(
                    height: 150.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.r),
                        bottomRight: Radius.circular(30.r),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Row(
                      children: [
                        /// Back Button
                        InkWell(
                          onTap: () => GoRouter.of(context).pop(),
                          child: CircleAvatar(
                            radius: 22.r,
                            backgroundColor: Colors.white.withValues(alpha: 0.3),
                            child: Icon(Icons.arrow_back, color: Colors.white, size: 22.sp),
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          "Reset Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// 🔲 Main Card
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(22.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /// 🔐 Rounded lock icon
                          Container(
                            padding: EdgeInsets.all(18.w),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Icon(
                              Icons.lock_outline,
                              size: 40.sp,
                              color: AppColors.white,
                            ),
                          ),

                          SizedBox(height: 18.h),

                          /// Title
                          Text(
                            "Forgot Your Password?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(height: 10.h),

                          /// Subtitle
                          Text(
                            "Enter your email address and we'll send you a\nverification code to reset your password.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[700],
                            ),
                          ),

                          SizedBox(height: 25.h),

                          /// Email Input Field
                          CustomTextFormField(
                            hintText: AuthKeys.email.tr(),
                            controller: _emailController,
                            prefixIcon: Icons.email_outlined,
                            validator: (value) {
                              if (value != null &&
                                  value.isNotEmpty &&
                                  EmailValidator.validate(value)) {
                                return null;
                              }
                              return AuthKeys.enterYourEmail.tr();
                            },
                          ),

                          SizedBox(height: 25.h),

                          /// Send Verification Code Button
                          CustomButton(
                            isLoading: isLoading,
                            text: AuthKeys.sendResetLink.tr(),
                            width: double.infinity,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthCubit>().sendPasswordResetEmail(
                                  _emailController.text.trim(),
                                );
                              } else {
                                CustomSnackBar.show(
                                  context,
                                  message: AuthKeys.enterYourEmail.tr(),
                                  backgroundColor: AppColors.error,
                                  icon: Icons.error,
                                );
                              }
                            },
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// 🔵 Bottom “Sign In”
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Remember your password? ",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => GoRouter.of(context).go(AppRoutes.kAuth),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}
