// dart
import 'package:cartoon_app/features/home/preseantation/logic/profile_cubit.dart';
import 'package:cartoon_app/features/profile/domain/entities/setting_entitiy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/theme_cubit.dart';
import '../../../auth/presentation/logic/auth_cubit.dart';
import '../../../home/preseantation/widgets/header_section.dart';
import '../widgets/avatars_list.dart';
import '../widgets/custom_container_setting.dart';
import '../widgets/header_profile_container.dart';
import '../widgets/logout_buttoon.dart';
import '../widgets/setting_container.dart';
import '../widgets/settings_list.dart';
import '../../../../core/config/app_keys_localization.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Create the Provider here
    return const ProfileViewBody();
  }
}

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Now we can safely watch the Cubit
    final profileCubit = context.watch<ProfileCubit>();
    final authCubit = context.watch<AuthCubit>();
    final themeCubit = context.watch<ThemeCubit>(); // Connect ThemeCubit

    return ListView(
      padding: EdgeInsets.only(bottom: 20.h),
      children: [
        HeaderProfileContainer(
          title: '${GamificationKeys.level.tr()} 8 Student',
          subTitle: GamificationKeys.progressMsg.tr(),
          iconText: profileCubit.selectedIcon, // Use the state variable
          header: authCubit.fullName,
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: HeadersSection(
            text: ProfileKeys.avatar.tr(),
            haveSeeAll: false,
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
            height: 160.h, // Slightly increased to fit grid comfortably
            // Removed Expanded here - it causes crashes inside SizedBox
            child: const AvatarsList(),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: HeadersSection(text: ProfileKeys.settingsTitle.tr(), haveSeeAll: false),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomContainerSetting(
            widget: SettingList(themeCubit: themeCubit),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: HeadersSection(text: ProfileKeys.prefTitle.tr(), haveSeeAll: false),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomContainerSetting(
            widget: SettingContainer(
              settingEntity: SettingEntity(
                icon: Icons.dark_mode_outlined,
                text: ProfileKeys.prefDarkMode.tr(),
                subText: themeCubit.state.themeMode == ThemeMode.dark
                    ? ProfileKeys.settingsOn.tr()
                    : ProfileKeys.settingsOff.tr(),
                haveForwardIcon: false,
              ),
              switchValue: themeCubit.state.themeMode == ThemeMode.dark,
              onSwitchChanged: (value) => themeCubit.toggleTheme(),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: HeadersSection(text: ProfileKeys.supportTitle.tr(), haveSeeAll: false),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomContainerSetting(
            widget: SettingContainer(
              settingEntity: SettingEntity(
                icon: Icons.help_outline_outlined,
                text: ProfileKeys.supportHelp.tr(),
                subText: ProfileKeys.settingsOff.tr(),
                haveForwardIcon: true,
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        LogoutButton(),
        SizedBox(height: 20.h),
        Text(
          'EDUTOON v1.0.0 \n${ProfileKeys.footerMade.tr()}',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}