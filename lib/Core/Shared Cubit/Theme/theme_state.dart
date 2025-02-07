part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeLight extends ThemeState {}

class ThemeDark extends ThemeState {}


