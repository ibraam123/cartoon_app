import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/config/app_colors.dart';

class HeaderSubjectsPerformanceContainer extends StatelessWidget {
  const HeaderSubjectsPerformanceContainer({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

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
            color: theme.shadowColor.withValues(alpha: 0.08),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.09),
                  borderRadius: BorderRadius.circular(36.r),
                ),
                child: Icon(
                  Icons.data_saver_off_outlined,
                  color: AppColors.primary,
                  size: 24.r,
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      subTitle,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),

                    SizedBox(height: 14.h),
                  ],
                ),
              ),

              CircularPercentIndicator(
                radius: 26.r,
                lineWidth: 4.r,
                percent: 0.75,
                progressColor: AppColors.primary,
                backgroundColor: theme.dividerColor,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  "75%",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: LinearProgressIndicator(
              minHeight: 7.h,
              backgroundColor: theme.dividerColor,
              value: 0.50,
              valueColor: const AlwaysStoppedAnimation(Color(0xFF56B9E6)),
            ),
          ),
        ],
      ),
    );
  }
}
