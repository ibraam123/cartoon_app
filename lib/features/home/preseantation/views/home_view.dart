import 'package:flutter/material.dart';
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
    return ListView(
      children: [
        HeaderContainer(),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: DailyGoalContainer(),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: HeadersSection(text: "Continue Learning", haveSeeAll: true)
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ContinuesContainer(
            bkgColor: Colors.lightBlue,
            iconSubject: Icons.book_outlined,
            text: "Continue Learning",
            subText: "Continue Learning",
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: HeadersSection(text: "Your Subjects" , haveSeeAll: false) ,
        ),
        SizedBox(height: 10.h),
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
        ),
        SizedBox(height: 20.h),
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
          child: HeadersSection(text: "Recent Achievements" , haveSeeAll: false) ,
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListAchievements(
            iconText: "📚",
          ) ,
        ),
        SizedBox(height: 20.h),

      ],
    );
  }
}













