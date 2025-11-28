import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeeklyGoalsContainer extends StatelessWidget {
  const WeeklyGoalsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.all(
          Radius.circular(16.r),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Complete 5 quizzes",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  Text(
                      "3/5",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: theme.hintColor,
                      )
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              LinearProgressIndicator(
                minHeight: 8,
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation(theme.colorScheme.primary),
                value: 0.6,
                borderRadius: BorderRadius.circular(12.r) ,
              )
            ],
          ),
          SizedBox(height: 20.h),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Complete 5 quizzes",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  Text(
                      "3/5",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: theme.hintColor,
                      )
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              LinearProgressIndicator(
                minHeight: 8,
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation(theme.colorScheme.primary),
                value: 0.6,
                borderRadius: BorderRadius.circular(12.r) ,
              )
            ],
          ),
          SizedBox(height: 20.h),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Complete 5 quizzes",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  Text(
                      "3/5",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: theme.hintColor,
                      )
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              LinearProgressIndicator(
                minHeight: 8,
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation(theme.colorScheme.primary),
                value: 0.6,
                borderRadius: BorderRadius.circular(12.r) ,
              )
            ],
          ),
        ],
      ),
    );
  }
}
