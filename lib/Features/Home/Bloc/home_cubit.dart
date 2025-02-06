import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:offto/Features/Home/Data/search_model.dart';

import '../Data/search_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  final SearchRepo _searchRepo = SearchRepo();

  final TextEditingController searchController = TextEditingController();
  final TextEditingController arriveController = TextEditingController();
  final TextEditingController departController = TextEditingController();
  final TextEditingController guestsController = TextEditingController();

  String toText = "";

  void setToText(String value) {
    toText = value;
    emit(HomeUpdateTextState());
  }
  int calculateMonthCount(DateTime now, DateTime endDate) {
    return (endDate.year - now.year) * 12 + (endDate.month - now.month) + 1;
  }
  int daysInMonth(DateTime month) {
    return DateTime(month.year, month.month + 1, 0).day;
  }

  DateTime firstDayOfMonth(DateTime month) {
    return DateTime(month.year, month.month, 1);
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
  void setTravelDate(String arrive, String depart) {
    arriveController.text = arrive;
    departController.text = depart;
    emit(HomeUpdateDateState());
  }

  SearchModel? searchModel;

  Future<void> getCities({String? search}) async {
    try {
      emit(GetCitiesLoadingState());
      searchModel = await _searchRepo.getCities(search: search);
      emit(GetCitiesSuccessState(searchModel!));
    } catch (e) {
      log('error getting cities data $e');
      emit(GetCitiesErrorState(e.toString()));
    }
  }
}
