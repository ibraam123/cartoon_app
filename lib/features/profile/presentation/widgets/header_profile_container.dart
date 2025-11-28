import 'package:cartoon_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderProfileContainer extends StatelessWidget {
  const HeaderProfileContainer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.iconText,
    required this.header,
  });

  final String header;
  final String title;
  final String subTitle;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(20.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration( 
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(36.r),
                  border: Border.all(
                    color: theme.colorScheme.primary,
                    width: 2.r,
                  ),
                ),
                child: Text(
                  iconText,
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: theme.colorScheme.primary,
                  )
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    header,
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.bodyLarge!.color,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: theme.textTheme.bodyMedium!.color,
                    )
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: theme.textTheme.bodySmall!.color,
                    )
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 20.h),
          CustomButton(
            text: "Edit Profile",
            color: theme.colorScheme.primary,
            onTap: () {},
          )
        ],
      ),
    );
  }
}
