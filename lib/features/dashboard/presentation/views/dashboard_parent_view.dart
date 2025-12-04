import 'package:cartoon_app/core/config/app_colors.dart';
import 'package:cartoon_app/features/home/preseantation/widgets/header_section.dart';
import 'package:cartoon_app/core/config/app_keys_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/header_subject_performance_container.dart';
import '../widgets/lesson_progress_card.dart';
import '../widgets/weakly_report_continer.dart';

class DashboardParentView extends StatelessWidget {
  const DashboardParentView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      children: [
        const DashboardHeader(),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: HeadersSection(
            text: ParentKeys.perfTitle.tr(),
            haveSeeAll: false,
          ),
        ),
        SizedBox(height: 10.h),
        SubjectsList(),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: HeadersSection(
            text: ParentKeys.reportTitle.tr(),
            haveSeeAll: false,
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: WeeklyReportContainer(),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: HeadersSection(
            text: ParentKeys.recentTitle.tr(),
            haveSeeAll: true,
          ),
        ),
        SizedBox(height: 10.h),

        LessonsProgressList(),

        SizedBox(height: 20.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: HeadersSection(
            text: ParentKeys.recommendationsTitle.tr(),
            haveSeeAll: false,
          ),
        ),

        SizedBox(height: 10.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withValues(alpha: 0.06),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, color: AppColors.primary, size: 30.r),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Focus on Science",
                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Ahmed could benefit from additional practice in Science.",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}

class LessonsProgressList extends StatelessWidget {
  const LessonsProgressList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          LessonProgressCard(
            title: "Algebra Basics",
            subject: HomeKeys.subjectMath.tr(),
            timeAgo: ParentKeys.timeHoursAgo.tr(),
            percent: 95,
          ),
          SizedBox(height: 10.h),
          LessonProgressCard(
            title: "Algebra Basics",
            subject: HomeKeys.subjectMath.tr(),
            timeAgo: ParentKeys.timeHoursAgo.tr(),
            percent: 95,
          ),
          SizedBox(height: 10.h),
          LessonProgressCard(
            title: "Algebra Basics",
            subject: HomeKeys.subjectMath.tr(),
            timeAgo: ParentKeys.timeHoursAgo.tr(),
            percent: 95,
          ),
        ],
      ),
    );
  }
}

class SubjectsList extends StatelessWidget {
  const SubjectsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          HeaderSubjectsPerformanceContainer(
            title: HomeKeys.subjectMath.tr(),
            subTitle: "${ParentKeys.perfCurrentGrade.tr()} A",
          ),
          SizedBox(height: 16.h),
          HeaderSubjectsPerformanceContainer(
            title: HomeKeys.subjectMath.tr(),
            subTitle: "${ParentKeys.perfCurrentGrade.tr()} A",
          ),
          SizedBox(height: 16.h),
          HeaderSubjectsPerformanceContainer(
            title: HomeKeys.subjectMath.tr(),
            subTitle: "${ParentKeys.perfCurrentGrade.tr()} A",
          ),
        ],
      ),
    );
  }
}








