import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListAchievements extends StatelessWidget {
  const ListAchievements({super.key, required this.iconText});
  final String iconText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 80.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),

        physics: const BouncingScrollPhysics(), // nicer scroll
        padding: EdgeInsets.zero,

        itemBuilder: (context, index) {
          return Container(
            width: 80.w,
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(18.r),
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                iconText,
                style: TextStyle(
                  fontSize: 30.sp,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
