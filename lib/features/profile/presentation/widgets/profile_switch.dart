import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_colors.dart';

class ProfileSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const ProfileSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      activeThumbColor: AppColors.white,
      activeTrackColor: AppColors.primary,
      inactiveThumbColor: AppColors.white,
      inactiveTrackColor: const Color(0xffc6c6c6),
      onChanged: onChanged, // Passed from parent
    );
  }
}

class ProfileLanguageSwitch extends ProfileSwitch {
  const ProfileLanguageSwitch({
    super.key,
    required super.value,
    required super.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => onChanged?.call(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 80,
        height: 40,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment: value ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor.withValues(alpha: 0.9),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(width: 36, child: Center(child: _buildText('EN'))),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(width: 36, child: Center(child: _buildText('AR'))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildText(String text) => Text(
        text,
        style:  TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
        ),
      );
}
