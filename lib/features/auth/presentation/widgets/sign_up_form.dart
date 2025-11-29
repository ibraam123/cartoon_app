import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_keys_localization.dart';
import '../../../../core/widgets/custom_button.dart';
import '../logic/auth_cubit.dart';
import 'custom_form_text_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Column(
            children: [
              CustomTextFormField(
                controller: firstName,
                hintText: AuthKeys.firstName.tr(),
                prefixIcon: Icons.person_outline,
                validator: (v) => v!.isEmpty ? "Enter first name" : null,
              ),
              SizedBox(height: 12.h),

              CustomTextFormField(
                controller: lastName,
                hintText: AuthKeys.lastName.tr(),
                prefixIcon: Icons.person_outline,
                validator: (v) => v!.isEmpty ? "Enter last name" : null,
              ),
              SizedBox(height: 12.h),

              CustomTextFormField(
                controller: email,
                hintText: AuthKeys.fieldEmail.tr(),
                prefixIcon: Icons.email_outlined,
                validator: (v) =>
                EmailValidator.validate(v ?? "") ? null : "Invalid email",
              ),
              SizedBox(height: 12.h),

              CustomTextFormField(
                controller: password,
                hintText: AuthKeys.fieldPassword.tr(),
                obscureText: obscure,
                prefixIcon: Icons.lock_outline,
                suffixIconButton: IconButton(
                  onPressed: () => setState(() => obscure = !obscure),
                  icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
                ),
                validator: (v) =>
                v != null && v.length >= 6 ? null : "Password too short",
              ),
              SizedBox(height: 20.h),

              CustomButton(
                text: "Create Account",
                width: double.infinity,
                color: AppColors.primary,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthCubit>().signUpWithEmailAndPassword(
                      email: email.text.trim(),
                      password: password.text.trim(),
                      firstName: firstName.text.trim(),
                      lastName: lastName.text.trim(),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
