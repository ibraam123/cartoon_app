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
        text: "Logout",
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: const Text('Logout'),
                content: const Text('Are you sure you want to logout?'),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: AppColors.primary),
                    ),
                    onPressed: () {
                      Navigator.of(
                        dialogContext,
                      ).pop(); // Dismiss the dialog
                    },
                  ),
                  TextButton(
                    child: const Text(
                      'Logout',
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
