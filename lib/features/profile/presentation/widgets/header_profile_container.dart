import 'package:cartoon_app/core/widgets/custom_button.dart';
import 'package:cartoon_app/features/auth/presentation/widgets/custom_form_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_keys_localization.dart';
import '../../../auth/presentation/logic/auth_cubit.dart';

class HeaderProfileContainer extends StatelessWidget {
  const HeaderProfileContainer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.iconText,
    required this.header,
  });

  final String header;
  final String title; 
  final String subTitle;
  final String iconText;

  void _onEditProfile(BuildContext context, ThemeData theme) async {
    // 1. Access the necessary Cubit and initialize data
    final authCubit = context.read<AuthCubit>();
    final initialName = authCubit.fullName;
    final nameController = TextEditingController(text: initialName);
    final formKey = GlobalKey<FormState>();

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        // Use BlocProvider.value to make the existing cubit instance available
        return BlocProvider.value(
          value: authCubit,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 20.w,
              right: 20.w,
              top: 20.h,
            ),
            // 2. Use BlocListener to handle successful update and close the modal
            child: Form(
              key: formKey, // Assign the key for validation
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormField(
                    controller: nameController,
                    hintText: AuthKeys.fieldFullName.tr(),
                    prefixIcon: Icons.person,
                    validator: (value) {
                      final trimmedValue = value?.trim();
                      final initialNameTrimmed = initialName.trim();

                      // 1. Check for no change
                      if (trimmedValue == initialNameTrimmed) {
                        // Return a specific message instead of just null for better UX/feedback
                        return 'No changes detected.';
                      }

                      // 2. Check for empty/null
                      if (trimmedValue == null || trimmedValue.isEmpty) {
                        return AuthKeys.validationFullName.tr(); // "Full name is required"
                      }

                      // Split the name by one or more spaces
                      List<String> parts = trimmedValue.split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();

                      // 3. Enforce minimum two words
                      if (parts.length < 2) {
                        // Changed the error message slightly for clarity, though you can reuse AuthKeys.validationFullName.tr()
                        // AuthKeys.validationFullName.tr() typically means 'Full name is required',
                        // which might be confusing. You may want a new key like 'Must contain first and last name'.
                        return 'Please enter at least a first and last name.';
                      }

                      // 4. Enforce maximum three words (as requested)
                      else if (parts.length == 3 || parts.length > 3) {
                        // Return a specific error message for being too long
                        return 'Please enter only a first and last name.';
                      }

                      // 5. Validation passed
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  // 3. Use BlocBuilder to manage the loading state of the button
                  BlocBuilder<AuthCubit, AuthState>(
                    // Only rebuild when the state changes to/from loading/success/error
                    buildWhen: (previous, current) =>
                        current is AuthLoading ||
                        current is AuthSuccess ||
                        current is AuthError,
                    builder: (context, state) {
                      final isLoading = state is AuthLoading;
                      return CustomButton(
                        text: ProfileKeys.save.tr(),
                        color: theme.colorScheme.primary,
                        isLoading:
                            isLoading, // Set loading state on the button
                        onTap: isLoading
                            ? null // Disable button while loading
                            : () {
                                if (formKey.currentState!.validate()) {
                                  final input = nameController.text.trim();

                                  // If user entered only a first name, preserve existing last name(s)
                                  String finalFullName;
                                  if (input.contains(RegExp(r'\s+'))) {
                                    finalFullName = input;
                                  } else {
                                    final existing = initialName.trim();
                                    if (existing.isNotEmpty &&
                                        existing.contains(RegExp(r'\s+'))) {
                                      final parts = existing.split(
                                        RegExp(r'\s+'),
                                      );
                                      final lastParts = parts
                                          .sublist(1)
                                          .join(' ');
                                      finalFullName = '$input $lastParts';
                                    } else {
                                      finalFullName = input;
                                    }
                                  }

                                  authCubit.updateProfile(
                                    fullName: finalFullName,
                                  );
                                  Navigator.pop(context);
                                }
                              },
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(20.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(36.r),
                  border: Border.all(
                    color: theme.colorScheme.primary,
                    width: 2.r,
                  ),
                ),
                child: Text(
                  iconText,
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    header,
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.bodyLarge!.color,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: theme.textTheme.bodyMedium!.color,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: theme.textTheme.bodySmall!.color,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          CustomButton(
            text: ProfileKeys.edit.tr(),
            color: theme.colorScheme.primary,
            onTap: () => _onEditProfile(context, theme),
          ),
        ],
      ),
    );
  }
}
