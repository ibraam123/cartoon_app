import 'package:cartoon_app/features/profile/presentation/widgets/setting_container.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/theme_cubit.dart';
import '../../domain/entities/setting_entitiy.dart';

class SettingList extends StatelessWidget {
  final ThemeCubit themeCubit;
  const SettingList({super.key, required this.themeCubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Item 1: Language (Connected to Logic)
        SettingContainer(
          settingEntity: SettingEntity(
            icon: Icons.language_outlined,
            text: "English Language",
            subText: themeCubit.state.isEnglish ? "English" : "عربي",
            haveForwardIcon: false,
          ),
          switchValue: themeCubit.state.isEnglish,
          onSwitchChanged: (value) => themeCubit.toggleLanguage(context),
        ),
        const Divider(height: 1, color: Colors.black12),

        // Item 2: Notifications (Local/Dummy Logic for now)
        const SettingContainer(
          settingEntity: SettingEntity(
            icon: Icons.notifications_none_outlined,
            text: "Notifications",
            subText: "On",
            haveForwardIcon: false,
          ),
          switchValue: true, // Placeholder
        ),
        const Divider(height: 1, color: Colors.black12),

        // Item 3: Offline Downloads (Navigation)
        const SettingContainer(
          settingEntity: SettingEntity(
            icon: Icons.download_outlined,
            text: "Offline Downloads",
            subText: "4 lessons",
            haveForwardIcon: true,
          ),
        ),
      ],
    );
  }
}
