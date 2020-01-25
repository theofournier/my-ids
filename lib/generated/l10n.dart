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

  String get editId {
    return Intl.message(
      'Edit ID',
      name: 'editId',
      desc: '',
      args: [],
    );
  }

  String get copied {
    return Intl.message(
      'Copied!',
      name: 'copied',
      desc: '',
      args: [],
    );
  }

  String get newId {
    return Intl.message(
      'New ID',
      name: 'newId',
      desc: '',
      args: [],
    );
  }

  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  String get id {
    return Intl.message(
      'Id',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  String get color {
    return Intl.message(
      'Color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  String get noColor {
    return Intl.message(
      'No color',
      name: 'noColor',
      desc: '',
      args: [],
    );
  }

  String get ok {
    return Intl.message(
      'Okay',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  String get undo {
    return Intl.message(
      'Undo',
      name: 'undo',
      desc: '',
      args: [],
    );
  }

  String get addIdItem {
    return Intl.message(
      'Add ID item',
      name: 'addIdItem',
      desc: '',
      args: [],
    );
  }

  String get confirmationDialogTitle {
    return Intl.message(
      'Confirmation',
      name: 'confirmationDialogTitle',
      desc: '',
      args: [],
    );
  }

  String get removeIdConfirmation {
    return Intl.message(
      'Do you want remove this ID?',
      name: 'removeIdConfirmation',
      desc: '',
      args: [],
    );
  }

  String get idRemoved {
    return Intl.message(
      'ID removed',
      name: 'idRemoved',
      desc: '',
      args: [],
    );
  }

  String get noIdFound {
    return Intl.message(
      'No ID founded',
      name: 'noIdFound',
      desc: '',
      args: [],
    );
  }

  String get noId {
    return Intl.message(
      'No ID added yet',
      name: 'noId',
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