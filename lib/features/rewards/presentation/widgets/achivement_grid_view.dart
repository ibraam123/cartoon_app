import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class AchievementCard extends StatelessWidget {
  const AchievementCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.icon,
  });

  final String emoji;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: theme.brightness == Brightness.light ? Colors.black12 : Colors.black54,
            blurRadius: 8.r,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: FittedBox(
              child: Text(
                emoji,
                style: TextStyle(fontSize: 40.sp),
              ),
            ),
          ),

          SizedBox(height: 8.h),

          Flexible(
            flex: 2,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          SizedBox(height: 6.h),

          Icon(
            icon,
            color: theme.colorScheme.secondary,
            size: 20.r,
          ),
        ],
      ),
    );
  }
}

class AchievementsGridView extends StatelessWidget {
  const AchievementsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics() ,
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.85, // More responsive than 1.0
      ),
      itemBuilder: (context, index) {
        return SizedBox(
          height: 150.h,
          child: AchievementCard(
            emoji: "🎯",
            title: "Sharp Shooter",
            icon: Icons.workspace_premium_outlined,
          ),
        );
      },
    );
  }
}
