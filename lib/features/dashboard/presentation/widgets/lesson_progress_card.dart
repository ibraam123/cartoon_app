import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonProgressCard extends StatelessWidget {
  final String title;
  final String subject;
  final String timeAgo;
  final int percent;

  const LessonProgressCard({
    super.key,
    required this.title,
    required this.subject,
    required this.timeAgo,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 12,
            spreadRadius: 1,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ================= LEFT SIDE =================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleMedium),

                SizedBox(height: 6.h),

                Text(subject, style: theme.textTheme.bodyMedium),

                SizedBox(height: 8.h),

                Text(
                  timeAgo,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.textTheme.bodySmall?.color?.withValues(
                      alpha: 0.6,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ================= RIGHT SIDE PILL =================
          Container(
            padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 14.w),
            decoration: BoxDecoration(
              color: theme.brightness == Brightness.light
                  ? const Color(0xffe8f8e8)
                  : Colors.green.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              "$percent%",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
