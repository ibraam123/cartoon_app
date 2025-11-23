import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectContainer extends StatelessWidget {
  const SubjectContainer({super.key , required this.bkgColor, required this.iconSubject, required this.text});
  final Color bkgColor;
  final IconData iconSubject;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              offset: Offset(0, 4),
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: bkgColor.withValues(alpha: 0.07),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.translate,
                  color: bkgColor,
                  size: 24.r,
                ),
              ),
              Spacer(),
              Column(
                children: [
                  Text("Progress" , style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                  ),),
                  SizedBox(height: 4.h),
                  Text(
                      "50%",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: bkgColor,
                      )
                  )

                ],
              )
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10.h),
          LinearProgressIndicator(
            minHeight: 8.h,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation(Color(0xFF56B9E6)),
            value: 0.5,
            borderRadius: BorderRadius.circular(12.r) ,
          )
        ],
      ),
    );
  }
}
