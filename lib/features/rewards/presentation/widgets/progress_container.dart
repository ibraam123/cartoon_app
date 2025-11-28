import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressContainer extends StatelessWidget {
  const ProgressContainer({
    super.key,
    required this.icon,
    required this.colorIcon,
    required this.title,
    required this.subTitle,
  });

  final IconData icon;
  final Color colorIcon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 👈 makes all same height
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: colorIcon.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(32.r),
            ),
            padding: EdgeInsets.all(8.r),
            child: Icon(
              icon,
              color: colorIcon,
              size: 30.r,
            ),
          ),

          SizedBox(height: 8.h),

          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: theme.textTheme.bodyLarge?.color,
            ),
          ),

          SizedBox(height: 4.h),

          Text(
            subTitle,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 12.sp,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
