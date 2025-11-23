import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_keys_localization.dart';
import '../../../../core/widgets/custom_button.dart';
import '../logic/auth_cubit.dart';
import 'custom_form_text_field.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: email,
            hintText: AuthKeys.email.tr(),
            prefixIcon: Icons.email_outlined,
            validator: (v) =>
            EmailValidator.validate(v ?? "") ? null : "Invalid email",
          ),
          SizedBox(height: 12.h),

          CustomTextFormField(
            controller: password,
            hintText: AuthKeys.password.tr(),
            obscureText: obscure,
            prefixIcon: Icons.lock_outline,
            suffixIconButton: IconButton(
              onPressed: () => setState(() => obscure = !obscure),
              icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
            ),
            validator: (v) =>
            v != null && v.length >= 6 ? null : "Password too short",
          ),

          SizedBox(height: 12.h),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () =>
                  GoRouter.of(context).pushNamed('forgetPassword'),
              child: const Text("Forgot Password?" , style: TextStyle(color: AppColors.primary)),
            ),
          ),
          SizedBox(height: 20.h),

          CustomButton(
            text: "Sign In",
            width: double.infinity,
            color: AppColors.primary,
            onTap: () {
              if (formKey.currentState!.validate()) {
                context.read<AuthCubit>().signInWithEmailAndPassword(
                  email: email.text.trim(),
                  password: password.text.trim(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
