import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/helpers/cache_helper.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()) {
    loadSavedAvatar();
  }

  // Default icon
  String selectedIcon = "👦";

  // 1. Change and Save
  void changeIcon(String newIcon) {
    selectedIcon = newIcon;

    // Save to single instance
    CacheHelper.saveData(key: 'user_avatar', value: newIcon);

    emit(ProfileChangeIcon(newIcon));
  }

  // 2. Load on start
  void loadSavedAvatar() {
    // Try to get data
    final savedIcon = CacheHelper.getData(key: 'user_avatar');

    // If savedIcon is not null, update the variable
    if (savedIcon != null) {
      selectedIcon = savedIcon;
      // We emit a state so the UI rebuilds with the loaded icon
      emit(ProfileChangeIcon(selectedIcon));
    }
  }
}