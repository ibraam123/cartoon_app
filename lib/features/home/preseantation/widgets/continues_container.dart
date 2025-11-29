import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_colors.dart';

class ContinuesContainer extends StatelessWidget {
  const ContinuesContainer({super.key , required this.bkgColor, required this.iconSubject, required this.text, required this.subText});
  final Color bkgColor;
  final IconData iconSubject;
  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.all(
          Radius.circular(16.r),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.07),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: bkgColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  iconSubject,
                  color: AppColors.white,
                  size: 30.r,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    color: theme.textTheme.bodyLarge!.color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subText,
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.textTheme.bodySmall!.color,
                  ),
                )
              ]
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: bkgColor.withValues(alpha: 0.07),
              borderRadius: BorderRadius.circular(32.r),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow,
                color: bkgColor,
                size: 24.r,
              ),
            ),
          )
        ],
      ),
    );
  }
}
