import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_colors.dart';

class HeadersSection extends StatelessWidget {
  const HeadersSection({super.key , required this.text, this.haveSeeAll});
  final String text;
  final bool? haveSeeAll;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
        haveSeeAll! ? TextButton(
          onPressed: () {},
          child: Text(
            "See All",
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.primary,
            ),
          ),
        ) : Container()
      ],
    );
  }
}
