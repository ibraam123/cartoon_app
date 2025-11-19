import 'package:cartoon_app/core/config/app_colors.dart';
import 'package:cartoon_app/core/widgets/custom_button.dart';
import 'package:cartoon_app/features/auth/presentation/widgets/custom_form_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_keys_localization.dart';
import '../../../../core/widgets/custom_snackbar.dart';
import '../logic/auth_cubit.dart';
import '../widgets/segment_option.dart';

class AuthTestView extends StatefulWidget {
  const AuthTestView({super.key});

  @override
  State<AuthTestView> createState() => _AuthTestViewState();
}

class _AuthTestViewState extends State<AuthTestView> {

  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  int _tabIndex = 0;

  // form controllers (example)
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();


  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_tabIndex == 0) { // Sign In
        context.read<AuthCubit>().signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } else { // Sign Up
        context.read<AuthCubit>().signUpWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
        );
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          CustomSnackBar.show(
            context,
            message: "Loading...",
            icon: Icons.hourglass_empty,
            backgroundColor: Colors.blueGrey,
          );
        }

        if (state is AuthError) {
          CustomSnackBar.show(
            context,
            message: state.errorMessage,
            icon: Icons.error_outline,
            backgroundColor: Colors.red,
          );
        }

        if (state is AuthSuccess) {
          CustomSnackBar.show(
            context,
            message: "Welcome ${state.user?.firstName}!",
            icon: Icons.check_circle_outline,
            backgroundColor: Colors.green,
          );
        }
      },
      child: buildUi(),
    );
  }

  Widget buildUi(){
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 24.0.h, horizontal: 20.w),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child: Text(
                  "📚",
                  style: TextStyle(
                    fontSize: 48.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Welcome to EDUTOON',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6.h),
              Text(
                'Learn, Grow, Succeed',
                style: TextStyle(fontSize: 16.sp, color: Colors.black54),
              ),
              SizedBox(height: 24.h),
              // Card container with rounded corners (Sign In / Sign Up tabbed)
              Container(
                width: double.infinity,
                // give it an approximate height; it will grow with content
                padding: EdgeInsets.symmetric(
                  horizontal: 18.w,
                  vertical: 18.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 18.r,
                      offset: Offset(0, 8.h),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Tab row
                      Row(
                        children: [
                          SegmentOption(
                            label: 'Sign In',
                            index: 0,
                            selectedIndex: _tabIndex,
                            onTap: () => setState(() => _tabIndex = 0)  ,
                          ),
                          SizedBox(width: 12.w),
                          SegmentOption(
                            label: 'Sign Up',
                            index: 1,
                            selectedIndex: _tabIndex,
                            onTap: () => setState(() => _tabIndex = 1),
                          ),
                        ],
                      ),

                      SizedBox(height: 18.h),

                      // Form fields
                      // If Sign In, show Email or Phone + Password; If Sign Up, maybe show email/phone/password similarly
                      if (_tabIndex == 0)
                        Column(
                          children: [
                            CustomTextFormField(
                              hintText: AuthKeys.email.tr(),
                              controller: _emailController,
                              prefixIcon: Icons.email_outlined,
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
                            SizedBox(height: 12.h),
                            CustomTextFormField(
                              hintText: AuthKeys.password.tr(),
                              controller: _passwordController,
                              obscureText: isObscure,
                              prefixIcon: Icons.lock_outline,
                              suffixIconButton: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                icon: Icon(
                                  isObscure ? Icons.visibility_off : Icons.visibility,
                                  color: AppColors.greyDark,
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
                            SizedBox(height: 12.h),

                            // Forgot password aligned right
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  GoRouter.of(context).pushNamed(
                                    'forgetPassword',
                                  );
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: const Color(0xFF56B9E6),
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                child: const Text('Forgot Password?'),
                              ),
                            ),
                          ],
                        )
                      else
                        Column(
                          children: [
                            CustomTextFormField(
                              hintText: AuthKeys.firstName.tr(),
                              controller: _firstNameController,
                              prefixIcon: Icons.person_outline,
                              validator: (value) {
                                if (value != null &&
                                    value.isNotEmpty) {
                                  return null;
                                } else {
                                  return AuthKeys.enterFirstName.tr();
                                }
                              },
                            ),
                            SizedBox(height: 12.h),
                            CustomTextFormField(
                              hintText: AuthKeys.lastName.tr(),
                              prefixIcon: Icons.person_outline,
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
                            SizedBox(height: 12.h),
                            CustomTextFormField(
                              hintText: AuthKeys.email.tr(),
                              controller: _emailController,
                              prefixIcon: Icons.email_outlined,
                              validator: (value) {
                                if (value != null && value.isNotEmpty && EmailValidator.validate(value))
                                {
                                  return null;
                                } else {
                                  return AuthKeys
                                      .pleaseEnterValidEmail
                                      .tr();
                                }
                              },
                            ),
                            SizedBox(height: 12.h),
                            CustomTextFormField(
                              hintText: AuthKeys.password.tr(),
                              controller: _passwordController,
                              obscureText: isObscure,
                              prefixIcon: Icons.lock_outline,
                              suffixIconButton: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                icon: Icon(
                                  isObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.greyDark,
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
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              CustomButton(
                text: _tabIndex == 0 ? 'Sign In' : 'Create Account',
                onTap: _submitForm,
                width: double.infinity,
                color: AppColors.primary,
              ),
              SizedBox(height: 24.h),
              Text(
                "🎓",
                style: TextStyle(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                textAlign: TextAlign.center,
                'Join thousands of students learning with fun!',
                style: TextStyle(fontSize: 12.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/* Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F4F7),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Student pill (selected)
                      GestureDetector(
                        onTap: () => setState(() => _selectedUser = 'student'),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 220),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: _selectedUser == 'student'
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: _selectedUser == 'student'
                                ? [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ]
                                : null,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person_outline,
                                color: _selectedUser == 'student'
                                    ? const Color(0xFF56B9E6)
                                    : Colors.grey[600],
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Student',
                                style: TextStyle(
                                  color: _selectedUser == 'student'
                                      ? const Color(0xFF56B9E6)
                                      : Colors.grey[700],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      // Parent pill (unselected)
                      GestureDetector(
                        onTap: () => setState(() => _selectedUser = 'parent'),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 220),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: _selectedUser == 'parent'
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: _selectedUser == 'parent'
                                ? [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ]
                                : null,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.people_outline,
                                color: _selectedUser == 'parent'
                                    ? const Color(0xFF56B9E6)
                                    : Colors.grey[600],
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Parent',
                                style: TextStyle(
                                  color: _selectedUser == 'parent'
                                      ? const Color(0xFF56B9E6)
                                      : Colors.grey[700],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),*/

