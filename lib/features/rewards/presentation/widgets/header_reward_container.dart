import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/config/app_colors.dart';

class HeaderRewardsContainer extends StatelessWidget {
  const HeaderRewardsContainer({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          // ================== LEFT SIDE INFO ==================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),

                SizedBox(height: 6.h),

                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: 14.h),

                // ---------- XP Progress Bar ----------
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: LinearProgressIndicator(
                    minHeight: 7.h,
                    backgroundColor: Colors.grey[200],
                    value: 0.50,
                    valueColor:
                    AlwaysStoppedAnimation(Color(0xFF56B9E6)),
                  ),
                ),
              ],
            ),
          ),


          SizedBox(width: 20.w),

          // ================== RIGHT SIDE CIRCLE ==================
          CircularPercentIndicator(
            radius: 42.r,
            lineWidth: 8.r,
            percent: 0.75,
            progressColor: AppColors.primary,
            backgroundColor: Colors.grey[200]!,
            circularStrokeCap: CircularStrokeCap.round,
            center: Text(
              "75%",
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
