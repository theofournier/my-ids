// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  final String localeName;

  String get appTitle {
    return Intl.message(
      'My IDs',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  String get homeTitle {
    return Intl.message(
      'Welcome on My IDs',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  String get homeText {
    return Intl.message(
      'Mes IDs vous permet de sauvegarder en local sur votre portable des identifiants, des mots de passes ainsi que des notes et de leur assigner une couleur',
      name: 'homeText',
      desc: '',
      args: [],
    );
  }

  String get bottomBarIDs {
    return Intl.message(
      'IDs',
      name: 'bottomBarIDs',
      desc: '',
      args: [],
    );
  }

  String get bottomBarProfile {
    return Intl.message(
      'Profile',
      name: 'bottomBarProfile',
      desc: '',
      args: [],
    );
  }

  String get searchId {
    return Intl.message(
      'Search an ID',
      name: 'searchId',
      desc: '',
      args: [],
    );
  }

  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('en', ''), Locale('fr', ''),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}