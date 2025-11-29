// dart
import 'package:cartoon_app/core/config/app_colors.dart';
import 'package:cartoon_app/core/widgets/custom_button.dart';
import 'package:cartoon_app/features/home/preseantation/widgets/header_section.dart';
import 'package:cartoon_app/core/config/app_keys_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/achivement_grid_view.dart';
import '../widgets/header_reward_container.dart';
import '../widgets/progress_container.dart';
import '../widgets/weekly_goals_container.dart';

class RewardsView extends StatelessWidget {
  const RewardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Title / subtitle use gamification keys
        HeaderRewardsContainer(
          title: "${GamificationKeys.level.tr()} 8",
          subTitle: GamificationKeys.progressMsg.tr(),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: HeadersSection(text: GamificationKeys.statsTitle.tr() , haveSeeAll: false,),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: ProgressContainer(
                    icon: Icons.outlet_outlined,
                    colorIcon: Colors.yellowAccent,
                    title: "2,450",
                    subTitle: GamificationKeys.statsTotalXp.tr(),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: ProgressContainer(
                    icon: Icons.outlet_outlined,
                    colorIcon: Colors.greenAccent,
                    title: "12",
                    subTitle: GamificationKeys.statsStreak.tr(),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: ProgressContainer(
                    icon: Icons.outlet_outlined,
                    colorIcon: Colors.redAccent,
                    title: "28",
                    subTitle: GamificationKeys.statsCompleted.tr(),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: HeadersSection(text: GamificationKeys.achievementsTitle.tr() , haveSeeAll: false,),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: AchievementsGridView(),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: HeadersSection(text: GamificationKeys.goalsTitle.tr() , haveSeeAll: false,),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: WeeklyGoalsContainer(),
        ),
        SizedBox(height: 30.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomButton(
            text: GamificationKeys.continueBtn.tr(),
            color: AppColors.primary,
            onTap: () {},
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}