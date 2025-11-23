import 'package:flutter/material.dart';

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
