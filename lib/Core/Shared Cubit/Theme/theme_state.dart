part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeLight extends ThemeState {}

class ThemeDark extends ThemeState {}

/// Change Language State
class ChangeLanguageState extends ThemeState {
  final Locale locale;

  ChangeLanguageState(this.locale);
}
