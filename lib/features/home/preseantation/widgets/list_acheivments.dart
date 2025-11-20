import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListAchievements extends StatelessWidget {
  const ListAchievements({super.key , required this.iconText});
  final String iconText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 10.w),
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),

              ),
              child: Center(
                child: Text(
                  iconText,
                  style: TextStyle(
                    fontSize: 32.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
