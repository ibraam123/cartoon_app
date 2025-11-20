import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeeklyGoalsContainer extends StatelessWidget {
  const WeeklyGoalsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Complete 5 quizzes",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                      "3/5",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      )
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              LinearProgressIndicator(
                minHeight: 8,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Color(0xFF56B9E6)),
                value: 0.6,
                borderRadius: BorderRadius.circular(12.r) ,
              )
            ],
          ),
          SizedBox(height: 20.h),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Complete 5 quizzes",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                      "3/5",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      )
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              LinearProgressIndicator(
                minHeight: 8,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Color(0xFF56B9E6)),
                value: 0.6,
                borderRadius: BorderRadius.circular(12.r) ,
              )
            ],
          ),
          SizedBox(height: 20.h),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Complete 5 quizzes",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                      "3/5",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      )
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              LinearProgressIndicator(
                minHeight: 8,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Color(0xFF56B9E6)),
                value: 0.6,
                borderRadius: BorderRadius.circular(12.r) ,
              )
            ],
          ),
        ],
      ),
    );
  }
}
