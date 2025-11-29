import 'package:cartoon_app/core/config/app_colors.dart';
import 'package:cartoon_app/core/config/app_keys_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadersSection extends StatelessWidget {
  const HeadersSection({super.key , required this.text, this.haveSeeAll});
  final String text;
  final bool? haveSeeAll;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: 16.sp
          )
        ),
        if(haveSeeAll ?? false)
          TextButton(
            onPressed: () {},
            child: Text(
              HomeKeys.continueSeeAll.tr(),
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 12.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w500
              ),
            ),
          )
      ],
    );
  }
}
