import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_keys_localization.dart';
import '../../../auth/presentation/logic/auth_cubit.dart';
import '../../domain/entities/dashboard_card_entiity.dart';
import 'dashbaord_container.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(16.w),
      color: AppColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ParentKeys.title.tr(),
            style: theme.textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            "${context.watch<AuthCubit>().fullName} - Grade 8",
            style: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DashBoardContainer(
                  dashboardCardEntity: DashboardCardEntity(
                    icon: Icons.video_library,
                    title: '15',
                    subTitle: ParentKeys.perfVideos.tr() ,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: DashBoardContainer(
                  dashboardCardEntity: DashboardCardEntity(
                    icon: Icons.quiz,
                    title: '10',
                    subTitle: ParentKeys.perfQuizzes.tr(),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: DashBoardContainer(
                  dashboardCardEntity: DashboardCardEntity(
                    icon: Icons.star,
                    title: '150',
                    subTitle: ParentKeys.perfPoints.tr() ,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
