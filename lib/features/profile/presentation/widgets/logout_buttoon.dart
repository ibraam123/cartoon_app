import 'package:cartoon_app/core/config/app_keys_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/routes.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../auth/presentation/logic/auth_cubit.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomButton(
        text: ProfileKeys.logout.tr(),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title:  Text(
                  ProfileKeys.logout.tr(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content:  Text(
                  ProfileKeys.logoutConfirm.tr(),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      ProfileKeys.cancel.tr() ,
                      style: TextStyle(color: AppColors.primary),
                    ),
                    onPressed: () {
                      Navigator.of(
                        dialogContext,
                      ).pop(); // Dismiss the dialog
                    },
                  ),
                  TextButton(
                    child: Text(
                      ProfileKeys.logout.tr(),
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      context.read<AuthCubit>().signOut();
                      Navigator.of(dialogContext).pop();
                      GoRouter.of(context).go(AppRoutes.kAuth);
                    },
                  ),
                ],
              );
            },
          );
        },
        color: Colors.red,
      ),
    );
  }
}
