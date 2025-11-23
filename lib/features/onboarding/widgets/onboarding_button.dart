import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/app_colors.dart';

class OnBoardingButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool? isDone;
  const OnBoardingButton({
    super.key,
    this.text = "Next",
    this.icon,
    this.isDone = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: isDone! ? Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ) : Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 6.w),
          if (icon != null) Expanded(child: Icon(icon, color: Colors.white, size: 20.sp)),
        ],
      ),
    );
  }
}
