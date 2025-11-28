import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const String _themeKey = 'themeMode';
  static const String _languageKey = 'isEnglish';

  ThemeCubit()
      : super(const ThemeState(
    themeMode: ThemeMode.light,
    isEnglish: true,
  )) {
    _loadTheme();
  }

  // ---------------------------
  // Toggle Theme
  // ---------------------------
  void toggleTheme() {
    final newTheme =
    state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    emit(state.copyWith(themeMode: newTheme));
    _saveTheme(newTheme);
  }

  // ---------------------------
  // Toggle Language (fixed)
  // ---------------------------
  Future<void> toggleLanguage(BuildContext context) async {
    final newIsEnglish = !state.isEnglish;

    // Apply localization FIRST
    await context.setLocale(
        newIsEnglish ? const Locale('en') : const Locale('ar'));

    // Then update state ONCE
    emit(state.copyWith(isEnglish: newIsEnglish));

    // Save to storage
    _saveLanguage(newIsEnglish);
  }

  // ---------------------------
  // Save Language
  // ---------------------------
  Future<void> _saveLanguage(bool isEnglish) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_languageKey, isEnglish);
  }

  // ---------------------------
  // Save Theme
  // ---------------------------
  Future<void> _saveTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_themeKey, mode.name);
  }

  // ---------------------------
  // Load Saved Settings
  // ---------------------------
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    final savedThemeString = prefs.getString(_themeKey);
    final savedLang = prefs.getBool(_languageKey) ?? true;

    final themeMode = ThemeMode.values.firstWhere(
          (e) => e.name == savedThemeString,
      orElse: () => ThemeMode.light,
    );

    emit(ThemeState(
      themeMode: themeMode,
      isEnglish: savedLang,
    ));
  }
}
