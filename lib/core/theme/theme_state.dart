part of 'theme_cubit.dart';

@immutable
class ThemeState {
  final ThemeMode themeMode;
  final bool isEnglish;
  final bool isLoading;

  const ThemeState({
    required this.themeMode,
    required this.isEnglish,
    this.isLoading = false,
  });

  ThemeState copyWith({
    ThemeMode? themeMode,
    bool? isEnglish,
    bool? isLoading,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      isEnglish: isEnglish ?? this.isEnglish,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
