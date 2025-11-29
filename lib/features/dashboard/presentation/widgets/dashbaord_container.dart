import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_colors.dart';
import '../../domain/entities/dashboard_card_entiity.dart';

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
