import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_keys_localization.dart';

class WeeklyReportContainer extends StatelessWidget {
  const WeeklyReportContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(20.w),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: theme.brightness == Brightness.light
              ? [const Color(0xffeaf4f7), const Color(0xffecf5ec)]
              : [
            theme.colorScheme.surface.withValues(alpha: 0.1),
            theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
            theme.colorScheme.surface.withValues(alpha: 0.1),

          ],
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.06),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: _StatCard(
                    title: ParentKeys.reportLessons.tr(),
                    value: "12",
                    subtitle: "+3 ${ParentKeys.reportFromLastWeek.tr()}",
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _StatCard(
                    title: ParentKeys.reportStudyTime.tr(),
                    value: "8.5h",
                    subtitle: "+1.2h ${ParentKeys.reportFromLastWeek.tr()}",
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15.h),

          /// ---------- Engagement Card ----------
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(18.r),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ParentKeys.reportEngagement.tr(),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: LinearProgressIndicator(
                    minHeight: 8.h,
                    backgroundColor: theme.dividerColor,
                    value: 0.50,
                    valueColor: const AlwaysStoppedAnimation(Color(0xFF56B9E6)),
                  ),
                ),

                SizedBox(height: 8.h),
                Text(
                  "50% ${ParentKeys.statsThisWeek.tr()}",
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;

  const _StatCard({
    required this.title,
    required this.value,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 14.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.09),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Text(value, style: theme.textTheme.headlineSmall),
          SizedBox(height: 6.h),
          Text(subtitle, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}

