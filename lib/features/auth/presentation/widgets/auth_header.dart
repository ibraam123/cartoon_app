import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("📚", style: TextStyle(fontSize: 48.sp)),
        SizedBox(height: 8.h),
        Text(
          'Welcome to EDUTOON',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          'Learn, Grow, Succeed',
          style: TextStyle(fontSize: 16.sp, color: Colors.black54),
        ),
      ],
    );
  }
}
