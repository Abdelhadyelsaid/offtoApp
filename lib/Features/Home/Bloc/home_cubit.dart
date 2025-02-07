import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:offto/Features/Home/Data/search_model.dart';

import '../Data/room_model.dart';
import '../Data/search_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    rooms.add(Room(adults: 1, children: 0, infants: 0));
  }

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

  List<Room> rooms = [];
  String guestSummary = "";

  void updateSummary(String value) {
    guestSummary = value;
    emit(GuestsUpdatedState());
  }

  /// add and remove functions for rooms

  void addRoom() {
    if (rooms.length < 4) {
      rooms.add(Room(adults: 1, children: 0, infants: 0));
      emit(HomeUpdateCounterState());
    }
  }

  void removeRoom(int roomIndex) {
    if (rooms.length > 1) {
      rooms.removeAt(roomIndex);
      emit(HomeUpdateCounterState());
    }
  }

  /// Increment and decrement functions for adults
  void incrementAdult(int roomIndex) {
    if (rooms[roomIndex].adults < 6) {
      rooms[roomIndex].adults++;
      emit(HomeUpdateCounterState());
    }
  }

  void decrementAdult(int roomIndex) {
    if (rooms[roomIndex].adults > 1) {
      rooms[roomIndex].adults--;
      emit(HomeUpdateCounterState());
    }
  }

  /// Increment and decrement functions for children
  void incrementChild(int roomIndex) {
    if (rooms[roomIndex].children < 4) {
      rooms[roomIndex].children++;
      emit(HomeUpdateCounterState());
    }
  }

  void decrementChild(int roomIndex) {
    if (rooms[roomIndex].children > 0) {
      rooms[roomIndex].children--;
      emit(HomeUpdateCounterState());
    }
  }

  /// Increment and decrement functions for infants
  void incrementInfant(int roomIndex) {
    if (rooms[roomIndex].infants < 4) {
      rooms[roomIndex].infants++;
      emit(HomeUpdateCounterState());
    }
  }

  void decrementInfant(int roomIndex) {
    if (rooms[roomIndex].infants > 0) {
      rooms[roomIndex].infants--;
      emit(HomeUpdateCounterState());
    }
  }



  /// Function to fetch cities
  SearchModel? searchModel;
  Future<void> getCities({String? search, String? lang}) async {
    try {
      emit(GetCitiesLoadingState());
      searchModel = await _searchRepo.getCities(search: search, lang: lang);
      emit(GetCitiesSuccessState(searchModel!));
    } catch (e) {
      log('error getting cities data $e');
      emit(GetCitiesErrorState(e.toString()));
    }
  }

  ///Clear values
  void clearValues() {
    departController.clear();
    arriveController.clear();
    toText = "";
    guestSummary = "";
    rooms.clear();
    addRoom();
    emit(HomeInitial());
  }


  ///*************** Change Language ***************///
  String currentLanguage = 'en';

  void toggleLanguage() {
    currentLanguage = currentLanguage == 'ar' ? 'en' : 'ar';
    emit(ChangeLanguageState(Locale(currentLanguage)));
  }
}
