import 'package:cartoon_app/core/config/app_keys_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_colors.dart';

class DailyGoalContainer extends StatelessWidget {
  const DailyGoalContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 3),
            )
          ]
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              HomeKeys.goalTitle.tr(),
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              HomeKeys.goalProgress.tr(),
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                )
            ),
            SizedBox(height: 10.h),
            Text(
                HomeKeys.goalXpEarned.tr(),
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                )
            )
          ]
      ),
    );
  }
}
