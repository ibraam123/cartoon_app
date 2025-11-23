import 'package:cartoon_app/features/profile/presentation/widgets/profile_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_colors.dart';
import '../../domain/entities/setting_entitiy.dart';

class SettingContainer extends StatelessWidget {
  const SettingContainer({
    super.key,
    required this.settingEntity,
    this.switchValue = false,
    this.onSwitchChanged,
  });
  final SettingEntity settingEntity;
  final bool switchValue;
  final Function(bool)? onSwitchChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      width: double.infinity,
      color: Colors.white, // Background handled here
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.07),
              borderRadius: BorderRadius.circular(32.r),
            ),
            child: Icon(
              settingEntity.icon,
              color: AppColors.primary,
              size: 30.r,
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                settingEntity.text,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Text(
                settingEntity.subText,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          Spacer(),
          settingEntity.haveForwardIcon == true
              ? Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.black87,
            size: 20.r,
          )
              : ProfileSwitch(value: switchValue, onChanged: onSwitchChanged),
        ],
      ),
    );
  }
}
