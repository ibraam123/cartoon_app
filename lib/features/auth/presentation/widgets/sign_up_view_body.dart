import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
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

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscure = true;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
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
      child: BlocConsumer<AuthCubit, AuthState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          if (state is AuthError) {
            CustomSnackBar.show(
              context,
              message: state.errorMessage,
              backgroundColor: Theme.of(context).colorScheme.error,
              textColor: Theme.of(context).colorScheme.onError,
              icon: Icons.error,
            );
          }
          if (state is AuthSuccess) {
            GoRouter.of(context).go(AppRoutes.kIdentificationView);
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return Stack(
            children: [
              CustomMessageContainer(
                width: width,
                height: height,
                message: AuthKeys.joinUs.tr(),
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
                          // 🌟 Container for the form fields
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
                              children: [
                                // First + Last Name
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextFormField(
                                        hintText: AuthKeys.firstName.tr(),
                                        controller: _firstNameController,
                                        prefixIcon: Icons.person,
                                        validator: (value) {
                                          if (value != null &&
                                              value.isNotEmpty) {
                                            return null;
                                          } else {
                                            return AuthKeys.enterFirstName.tr();
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(width: width * 0.05),
                                    Expanded(
                                      child: CustomTextFormField(
                                        hintText: AuthKeys.lastName.tr(),
                                        prefixIcon: Icons.person,
                                        controller: _lastNameController,
                                        validator: (value) {
                                          if (value != null &&
                                              value.isNotEmpty) {
                                            return null;
                                          } else {
                                            return AuthKeys.enterLastName.tr();
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height * 0.02),

                                // Email
                                CustomTextFormField(
                                  hintText: AuthKeys.email.tr(),
                                  controller: _emailController,
                                  prefixIcon: Icons.email,
                                  validator: (value) {
                                    if (EmailValidator.validate(value!) &&
                                        value.isNotEmpty) {
                                      return null;
                                    } else {
                                      return AuthKeys
                                          .pleaseEnterValidEmail
                                          .tr();
                                    }
                                  },
                                ),
                                SizedBox(height: height * 0.02),

                                // Password
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
                                      isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: const Color(0xff9560e1),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value != null && value.length >= 6) {
                                      return null;
                                    } else {
                                      return AuthKeys
                                          .passwordMustBeAtLeast6Characters
                                          .tr();
                                    }
                                  },
                                ),
                                SizedBox(height: height * 0.03),

                                // Sign Up Button
                                CustomButton(
                                  text: AuthKeys.signUp.tr(),
                                  width: width,
                                  isLoading: isLoading,
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      context
                                          .read<AuthCubit>()
                                          .signUpWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        firstName:
                                        _firstNameController.text,
                                        lastName: _lastNameController.text,
                                      );
                                    } else {
                                      CustomSnackBar.show(
                                        context,
                                        message: AuthKeys
                                            .pleaseFillInAllFields
                                            .tr(),
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .error,
                                        textColor: Theme.of(context)
                                            .colorScheme
                                            .onError,
                                        icon: Icons.error,
                                      );
                                    }
                                  },
                                  color: AppColors.primary,
                                ),
                                SizedBox(height: height * 0.01),

                                // Already have account?
                                MessageSecondOption(
                                  message:
                                  AuthKeys.alreadyHaveAccount.tr(),
                                  buttonText: AuthKeys.logIn.tr(),
                                  onTap: () {
                                    GoRouter.of(context).pushReplacement(
                                        AppRoutes.kSignInView);
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
          );
        },
      ),
    );
  }
}
