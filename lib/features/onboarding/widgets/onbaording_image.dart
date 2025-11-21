import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingImage extends StatelessWidget {
  final String imagePath;
  final IconData icon;
  final Color colorIcon;
  const OnBoardingImage({
    required this.imagePath,
    required this.icon,
    required this.colorIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 300.h,
            width: 300.w,
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 12.h, right: 12.w),
          padding: EdgeInsets.all(10.r),
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8.r,
                offset: Offset(0, 3.h),
              )
            ],
          ),
          child: Icon(icon, color: colorIcon , size: 40.sp),
        ),
      ],
    );
  }
}
