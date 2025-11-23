import 'package:cartoon_app/features/auth/presentation/widgets/segment_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const AuthTabs({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SegmentOption(
          label: "Sign In",
          index: 0,
          selectedIndex: selectedIndex,
          onTap: () => onChanged(0),
        ),
        SizedBox(width: 12.w),
        SegmentOption(
          label: "Sign Up",
          index: 1,
          selectedIndex: selectedIndex,
          onTap: () => onChanged(1),
        ),
      ],
    );
  }
}
