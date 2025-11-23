import 'package:cartoon_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_colors.dart';

class HeaderProfileContainer extends StatelessWidget {
  const HeaderProfileContainer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.iconText,
    required this.header,
  });

  final String header;
  final String title;
  final String subTitle;
  final String iconText;

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
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(36.r),
                  border: Border.all(
                    color: AppColors.primary,
                    width: 2.r,
                  ),

                ),
                child: Text(
                  iconText,
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: AppColors.primary,
                  )
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    header,
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    )
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary.withValues(alpha: 0.8),
                    )
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 20.h),
          CustomButton(
            text: "Edit Profile",
            color: AppColors.primary,
            onTap: () {},
          )
        ],
      ),
    );
  }
}
