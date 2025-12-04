import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeeklyGoalsContainer extends StatelessWidget {
  const WeeklyGoalsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          _GoalItem(
            title: "Complete 5 quizzes",
            progressText: "3/5",
            progress: 0.6,
            backgroundColor: theme.dividerColor,
          ),
          SizedBox(height: 20.h),

          _GoalItem(
            title: "Read 3 stories",
            progressText: "1/3",
            progress: 0.33,
            backgroundColor: theme.dividerColor,
          ),
          SizedBox(height: 20.h),

          _GoalItem(
            title: "Finish 2 lessons",
            progressText: "1/2",
            progress: 0.5,
            backgroundColor: theme.dividerColor,
          ),
        ],
      ),
    );
  }
}

class _GoalItem extends StatelessWidget {
  final String title;
  final String progressText;
  final double progress;
  final Color backgroundColor;

  const _GoalItem({
    required this.title,
    required this.progressText,
    required this.progress,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
            Text(
              progressText,
              style: TextStyle(
                fontSize: 12.sp,
                color: theme.hintColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        LinearProgressIndicator(
          minHeight: 8,
          value: progress,
          backgroundColor: backgroundColor,
          valueColor: AlwaysStoppedAnimation(theme.colorScheme.primary),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ],
    );
  }
}
