import 'package:cartoon_app/core/config/app_keys_localization.dart';
import 'package:cartoon_app/features/auth/presentation/logic/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/continues_container.dart';
import '../widgets/daily_goal_container.dart';
import '../widgets/header_container.dart';
import '../widgets/header_section.dart';
import '../widgets/list_acheivments.dart';
import '../widgets/subject_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      children: [
        HeaderContainer(
          title: HomeKeys.welcome.tr(),
          subTitle: context.watch<AuthCubit>().fullName,
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const DailyGoalContainer(),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: HeadersSection(text: HomeKeys.continueTitle.tr(), haveSeeAll: true),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ContinuesContainer(
            bkgColor: theme.colorScheme.secondary,
            iconSubject: Icons.book_outlined,
            text: HomeKeys.continueComplete.tr(),
            subText: HomeKeys.continueTitle.tr(),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: HeadersSection(text: HomeKeys.subjectsTitle.tr(), haveSeeAll: false),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SubjectContainer(
                bkgColor: theme.colorScheme.secondary,
                iconSubject: Icons.book_outlined,
                text: "Continue Learning",
              ),
              SizedBox(height: 10.h),
              SubjectContainer(
                bkgColor: theme.colorScheme.secondary,
                iconSubject: Icons.book_outlined,
                text: "Continue Learning",
              ),
              SizedBox(height: 10.h),
              SubjectContainer(
                bkgColor: theme.colorScheme.secondary,
                iconSubject: Icons.book_outlined,
                text: "Continue Learning",
              ),
            ],
          ),
        ),
        /*SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SubjectContainer(
            bkgColor: Colors.lightBlue,
            iconSubject: Icons.book_outlined,
            text: "Continue Learning",
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SubjectContainer(
            bkgColor: Colors.lightBlue,
            iconSubject: Icons.book_outlined,
            text: "Continue Learning",
          ),
        ),*/
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: HeadersSection(text: HomeKeys.achievements.tr(), haveSeeAll: false),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const ListAchievements(iconText: "⭐"),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
