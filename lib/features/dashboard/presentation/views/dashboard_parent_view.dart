import 'package:cartoon_app/core/config/app_colors.dart';
import 'package:cartoon_app/features/auth/presentation/logic/auth_cubit.dart';
import 'package:cartoon_app/features/home/preseantation/widgets/header_section.dart';
import 'package:cartoon_app/core/config/app_keys_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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

        Padding(
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
        ),

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

        Padding(
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
        ),

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

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(16.w),
      color: AppColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ParentKeys.title.tr(),
            style: theme.textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            "${context.watch<AuthCubit>().fullName} - Grade 8",
            style: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DashBoardContainer(
                  dashboardCardEntity: DashboardCardEntity(
                    icon: Icons.video_library,
                    title: '15',
                    subTitle: ParentKeys.perfVideos.tr() ,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: DashBoardContainer(
                  dashboardCardEntity: DashboardCardEntity(
                    icon: Icons.quiz,
                    title: '10',
                    subTitle: ParentKeys.perfQuizzes.tr(),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: DashBoardContainer(
                  dashboardCardEntity: DashboardCardEntity(
                    icon: Icons.star,
                    title: '150',
                    subTitle: ParentKeys.perfPoints.tr() ,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DashBoardContainer extends StatelessWidget {
  const DashBoardContainer({super.key, required this.dashboardCardEntity});
  final DashboardCardEntity dashboardCardEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Color(0xff9bd3eb),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(dashboardCardEntity.icon, size: 20.r, color: AppColors.white),
            SizedBox(height: 3.h),
            Text(
              textAlign: TextAlign.center,
              dashboardCardEntity.title,
              style: TextStyle(
                fontSize: 16.sp,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              textAlign: TextAlign.center,
              dashboardCardEntity.subTitle,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCardEntity {
  final IconData icon;
  final String title;
  final String subTitle;

  const DashboardCardEntity({
    required this.icon,
    required this.title,
    required this.subTitle,
  });
}

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
                  theme.colorScheme.surface,
                  theme.colorScheme.surfaceContainerHighest,
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
