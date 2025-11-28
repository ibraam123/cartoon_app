import 'package:cartoon_app/core/config/app_colors.dart';
import 'package:cartoon_app/core/widgets/custom_button.dart';
import 'package:cartoon_app/features/home/preseantation/widgets/header_section.dart';
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
        HeaderRewardsContainer(
          title: "Level 8",
          subTitle: "350 XP to Level 9",
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: HeadersSection(text: "Your Progress" , haveSeeAll: false,),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(child: ProgressContainer(icon: Icons.outlet_outlined, colorIcon: Colors.yellowAccent, title: "2,450", subTitle: "Total XP")),
                SizedBox(width: 10.w),
                Expanded(child: ProgressContainer(icon: Icons.outlet_outlined, colorIcon: Colors.greenAccent, title: "12", subTitle: "Current Streak")),
                SizedBox(width: 10.w),
                Expanded(child: ProgressContainer(icon: Icons.outlet_outlined, colorIcon: Colors.redAccent , title: "28", subTitle: "Lessons Completed" )),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: HeadersSection(text: "Achievements" , haveSeeAll: false,),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: AchievementsGridView(),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: HeadersSection(text: "Weekly Goals" , haveSeeAll: false,),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: WeeklyGoalsContainer(),
        ),
        SizedBox(height: 30.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomButton(text: "Continue Learning", color: AppColors.primary , onTap: () {} ,),
        ),
        SizedBox(height: 20.h),






      ],
    );
  }
}





