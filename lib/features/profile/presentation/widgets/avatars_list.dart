import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_colors.dart';
import '../../../home/preseantation/logic/profile_cubit.dart';

class AvatarsList extends StatelessWidget {
  const AvatarsList({super.key});

  static const List<String> iconsAvatars = [
    "👨",
    "👩",
    "👱",
    "👵",
    "🧔",
    "👧",
    "👦",
    "👩‍🦱",
    "👴",
    "👱‍♀️",
    "🙍‍♂️",
    "👳‍♂️",
  ];

  @override
  Widget build(BuildContext context) {
    // Read the current selected icon to highlight it
    final selectedIcon = context.watch<ProfileCubit>().selectedIcon;

    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
      ),
      itemCount: iconsAvatars.length,
      // shrinkWrap is good, but since we are in a SizedBox, it's constrained anyway
      itemBuilder: (context, index) {
        final currentIcon = iconsAvatars[index];
        final isSelected = currentIcon == selectedIcon;

        return GestureDetector(
          onTap: () {
            // Logic to update the avatar
            context.read<ProfileCubit>().changeIcon(currentIcon);
          },
          child: Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              // Change color if selected to give feedback
              color: isSelected ? AppColors.primary : Colors.white,
              border: Border.all(color: AppColors.primary, width: 1.w),
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                if (isSelected)
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
              ],
            ),
            child: Center(
              child: Text(
                currentIcon,
                style: TextStyle(
                  fontSize: 30.sp,
                  // Emojis generally ignore color, but if this was an IconData:
                  color: isSelected ? Colors.white : AppColors.primary,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
