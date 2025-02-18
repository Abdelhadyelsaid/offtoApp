part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

///Get cities States
final class GetCitiesLoadingState extends HomeState {}

final class GetCitiesSuccessState extends HomeState {
  final SearchModel searchModel;

  GetCitiesSuccessState(this.searchModel);
}

final class GetCitiesErrorState extends HomeState {
  final String errorMessage;

  GetCitiesErrorState(this.errorMessage);
}

final class HomeUpdateTextState extends HomeState {}

final class HomeUpdateDateState extends HomeState {}

final class HomeUpdateCounterState extends HomeState {}

final class GuestsUpdatedState extends HomeState {}

/// Change Language State
class ChangeLanguageState extends HomeState {
  final Locale locale;

  ChangeLanguageState(this.locale);
}