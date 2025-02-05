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
  String toText="";
  void setToText(String value) {
    toText = value;
    emit(HomeUpdateTextState()); // Emit a state to trigger UI rebuild
  }
  final TextEditingController datesController = TextEditingController();
  final TextEditingController guestsController = TextEditingController();

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
