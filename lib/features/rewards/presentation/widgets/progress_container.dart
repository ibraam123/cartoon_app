import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressContainer extends StatelessWidget {
  const ProgressContainer({super.key , required this.icon, required this.colorIcon, required this.title, required this.subTitle});
  final IconData icon;
  final Color colorIcon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.17,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colorIcon.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(32.r),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  color: colorIcon,
                  size: 30.r,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis ,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,

              ),
            )
          ],
        ),
      ),
    );
  }
}
