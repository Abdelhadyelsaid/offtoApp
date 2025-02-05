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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flights`
  String get flights {
    return Intl.message(
      'Flights',
      name: 'flights',
      desc: '',
      args: [],
    );
  }

  /// `Packages`
  String get packages {
    return Intl.message(
      'Packages',
      name: 'packages',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Guests',
      name: 'guests',
      desc: '',
      args: [],
    );
  }

  /// `Travel To`
  String get travelTo {
    return Intl.message(
      'Travel To',
      name: 'travelTo',
      desc: '',
      args: [],
    );
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
