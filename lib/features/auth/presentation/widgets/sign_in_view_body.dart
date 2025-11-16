import 'package:cartoon_app/features/auth/presentation/widgets/remember_and_forget_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_keys_localization.dart';
import '../../../../core/config/routes.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_snackbar.dart';
import '../../../../core/widgets/custom_welcome_message_container.dart';
import '../logic/auth_cubit.dart';
import 'custom_form_text_field.dart';
import 'message_second_option.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return SafeArea(
      child: Stack(
        children: [
          CustomMessageContainer(
            width: width,
            height: height,
            message: AuthKeys.welcomeBack.tr(),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: SizedBox(
                height: height,
                width: width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(width * 0.06),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Email Field
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
                                  return AuthKeys.pleaseEnterValidEmail.tr();
                                }
                              },
                            ),
                            SizedBox(height: height * 0.02),

                            // Password Field
                            CustomTextFormField(
                              hintText: AuthKeys.password.tr(),
                              controller: _passwordController,
                              obscureText: isObscure,
                              prefixIcon: Icons.lock,
                              suffixIconButton: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                icon: Icon(
                                  isObscure ? Icons.visibility : Icons.visibility_off,
                                  color: const Color(0xff9560e1),
                                ),
                              ),
                              validator: (value) {
                                if (value != null && value.length >= 6) {
                                  return null;
                                } else {
                                  return AuthKeys.passwordMustBeAtLeast6Characters.tr();
                                }
                              },
                            ),
                            SizedBox(height: height * 0.01),

                            const RememberAndForgetMessage(),
                            SizedBox(height: height * 0.02),

                            BlocConsumer<AuthCubit, AuthState>(
                              listener: _authListener,
                              builder: (context, state) {
                                final isEmailLoading = state is AuthLoading && state.action == AuthAction.email;

                                return Column(
                                  children: [
                                    CustomButton(
                                      isLoading: isEmailLoading,
                                      text: AuthKeys.logIn.tr(),
                                      width: width,
                                      onTap: _signInWithEmailAndPassword,
                                      color: AppColors.primary,
                                    ),
                                    SizedBox(height: height * 0.01),
                                    MessageSecondOption(
                                      message: AuthKeys.dontHaveAccount.tr(),
                                      buttonText: AuthKeys.signUp.tr(),
                                      onTap: _navigateToSignUp,
                                    ),
                                    SizedBox(height: height * 0.015),
                                    Row(
                                      children: [
                                        const Expanded(child: Divider()),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.04),
                                          child: Text(
                                            AuthKeys.or.tr(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                    color: AppColors.greyDark),
                                          ),
                                        ),
                                        const Expanded(child: Divider()),
                                      ],
                                    ),
                                    SizedBox(height: height * 0.015),
                                    CustomButton(isLoading: false, text: AuthKeys.continueWithGoogle.tr(),
                                      width: width,
                                      onTap: _signInWithGoogle,
                                      color: AppColors.primary,
                                    ),
                                  ],
                                );
                              },
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
      ),
    );
  }

  void _signInWithGoogle() {
    context.read<AuthCubit>().signInWithGoogle();
  }

  void _authListener(BuildContext context, AuthState state) {
    if (state is AuthError) {
      CustomSnackBar.show(
        context,
        message: state.errorMessage,
        backgroundColor: AppColors.error,
        icon: Icons.error,
      );
    }
  }

  void _signInWithEmailAndPassword() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } else {
      CustomSnackBar.show(
        context,
        message: AuthKeys.pleaseFillInAllFields.tr(),
        backgroundColor: AppColors.error,
        icon: Icons.error,
      );
    }
  }

  void _navigateToSignUp() {
    GoRouter.of(context).pushReplacement(AppRoutes.kSignUpView);
  }
}
