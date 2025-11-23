import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_colors.dart';
import '../../../auth/presentation/widgets/custom_form_text_field.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({super.key , required this.title, required this.subTitle,});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              30.r,
            ),
            bottomRight: Radius.circular(
              30.r,
            ),
          )
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              Spacer(),
              Stack(
                children: [
                  Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.07),
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none_outlined,
                      color: AppColors.primary,
                      size: 30.r,
                    ),
                  ),
                ),
                  RedDotNotify()
                ]
              )
            ],
          ),
          SizedBox(height: 20.h),
          CustomTextFormField(
            hintText: "Search Lessons, subjects...",
            prefixIcon: Icons.search,
          )
        ],
      ),
    );
  }
}

class RedDotNotify extends StatelessWidget {
  const RedDotNotify({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        right: 0,
        child: Container(
          width: 16.r,
          height: 16.r,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: Text(
              "2",
              style: TextStyle(
                color: Colors.white,
                fontSize: 8.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        )
    );
  }
}
