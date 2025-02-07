// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flights`
  String get flights {
    return Intl.message('Flights', name: 'flights', desc: '', args: []);
  }

  /// `Packages`
  String get packages {
    return Intl.message('Packages', name: 'packages', desc: '', args: []);
  }

  /// `Packages Page`
  String get packagesPage {
    return Intl.message(
      'Packages Page',
      name: 'packagesPage',
      desc: '',
      args: [],
    );
  }

  /// `Flights Page`
  String get flightsPage {
    return Intl.message(
      'Flights Page',
      name: 'flightsPage',
      desc: '',
      args: [],
    );
  }

  /// `Great adventures start here, search for your hotel!`
  String get searchTitle {
    return Intl.message(
      'Great adventures start here, search for your hotel!',
      name: 'searchTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search for hotels`
  String get searchHotels {
    return Intl.message(
      'Search for hotels',
      name: 'searchHotels',
      desc: '',
      args: [],
    );
  }

  /// `Search Results Page`
  String get searchResultPage {
    return Intl.message(
      'Search Results Page',
      name: 'searchResultPage',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message('To', name: 'to', desc: '', args: []);
  }

  /// `Select Dates`
  String get selectDates {
    return Intl.message(
      'Select Dates',
      name: 'selectDates',
      desc: '',
      args: [],
    );
  }

  /// `Guests`
  String get guests {
    return Intl.message('Guests', name: 'guests', desc: '', args: []);
  }

  /// `Travel To`
  String get travelTo {
    return Intl.message('Travel To', name: 'travelTo', desc: '', args: []);
  }

  /// `Search for a city or airport name`
  String get searchHint {
    return Intl.message(
      'Search for a city or airport name',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `Travel Dates`
  String get travelDates {
    return Intl.message(
      'Travel Dates',
      name: 'travelDates',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Sun`
  String get Sun {
    return Intl.message('Sun', name: 'Sun', desc: '', args: []);
  }

  /// `Mon`
  String get Mon {
    return Intl.message('Mon', name: 'Mon', desc: '', args: []);
  }

  /// `Tue`
  String get Tue {
    return Intl.message('Tue', name: 'Tue', desc: '', args: []);
  }

  /// `Wed`
  String get Wed {
    return Intl.message('Wed', name: 'Wed', desc: '', args: []);
  }

  /// `Thu`
  String get Thu {
    return Intl.message('Thu', name: 'Thu', desc: '', args: []);
  }

  /// `Fri`
  String get Fri {
    return Intl.message('Fri', name: 'Fri', desc: '', args: []);
  }

  /// `Sat`
  String get Sat {
    return Intl.message('Sat', name: 'Sat', desc: '', args: []);
  }

  /// `+ Add Return Date`
  String get returnDate {
    return Intl.message(
      '+ Add Return Date',
      name: 'returnDate',
      desc: '',
      args: [],
    );
  }

  /// `+ Add Departure Date`
  String get departDate {
    return Intl.message(
      '+ Add Departure Date',
      name: 'departDate',
      desc: '',
      args: [],
    );
  }

  /// `Passengers & Rooms`
  String get passengers_rooms {
    return Intl.message(
      'Passengers & Rooms',
      name: 'passengers_rooms',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `Adult`
  String get adult {
    return Intl.message('Adult', name: 'adult', desc: '', args: []);
  }

  /// `Child`
  String get child {
    return Intl.message('Child', name: 'child', desc: '', args: []);
  }

  /// `Infant`
  String get infant {
    return Intl.message('Infant', name: 'infant', desc: '', args: []);
  }

  /// `Adults`
  String get adults {
    return Intl.message('Adults', name: 'adults', desc: '', args: []);
  }

  /// `Children`
  String get children {
    return Intl.message('Children', name: 'children', desc: '', args: []);
  }

  /// `Infants`
  String get infants {
    return Intl.message('Infants', name: 'infants', desc: '', args: []);
  }

  /// `Above 11 Year`
  String get above {
    return Intl.message('Above 11 Year', name: 'above', desc: '', args: []);
  }

  /// `Less than 1 Year`
  String get less {
    return Intl.message('Less than 1 Year', name: 'less', desc: '', args: []);
  }

  /// `2-11 Years`
  String get between {
    return Intl.message('2-11 Years', name: 'between', desc: '', args: []);
  }

  /// `Change language`
  String get language {
    return Intl.message(
      'Change language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Change theme`
  String get theme {
    return Intl.message('Change theme', name: 'theme', desc: '', args: []);
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Room`
  String get room {
    return Intl.message('Room', name: 'room', desc: '', args: []);
  }

  /// `Add another room`
  String get addRoom {
    return Intl.message(
      'Add another room',
      name: 'addRoom',
      desc: '',
      args: [],
    );
  }

  /// `Depart`
  String get depart {
    return Intl.message('Depart', name: 'depart', desc: '', args: []);
  }

  /// `Return`
  String get return_text {
    return Intl.message('Return', name: 'return_text', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
