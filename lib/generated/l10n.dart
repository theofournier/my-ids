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

  String get created {
    return Intl.message(
      'Created',
      name: 'created',
      desc: '',
      args: [],
    );
  }

  String get updated {
    return Intl.message(
      'Updated',
      name: 'updated',
      desc: '',
      args: [],
    );
  }

  String get isRequired {
    return Intl.message(
      'is required',
      name: 'isRequired',
      desc: '',
      args: [],
    );
  }

  String get idAdded {
    return Intl.message(
      'ID added!',
      name: 'idAdded',
      desc: '',
      args: [],
    );
  }

  String get idUpdated {
    return Intl.message(
      'ID updated!',
      name: 'idUpdated',
      desc: '',
      args: [],
    );
  }

  String get idDeleted {
    return Intl.message(
      'ID deleted!',
      name: 'idDeleted',
      desc: '',
      args: [],
    );
  }

  String get welcomeOn {
    return Intl.message(
      'Welcome on',
      name: 'welcomeOn',
      desc: '',
      args: [],
    );
  }

  String get firstEnterMasterCode {
    return Intl.message(
      'First, enter your master code',
      name: 'firstEnterMasterCode',
      desc: '',
      args: [],
    );
  }

  String get warningMasterCode {
    return Intl.message(
      'You can\'t retrieve it, so don\'t forget it',
      name: 'warningMasterCode',
      desc: '',
      args: [],
    );
  }

  String get setMasterCode {
    return Intl.message(
      'Set a master code of 4 to 8 digits',
      name: 'setMasterCode',
      desc: '',
      args: [],
    );
  }

  String get confirmMasterCode {
    return Intl.message(
      'Confirm master code',
      name: 'confirmMasterCode',
      desc: '',
      args: [],
    );
  }

  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  String get errorMasterCodeWrong {
    return Intl.message(
      'Wrong master code',
      name: 'errorMasterCodeWrong',
      desc: '',
      args: [],
    );
  }

  String get errorMasterCodeInvalid {
    return Intl.message(
      'Master code must be 4 to 8 digits',
      name: 'errorMasterCodeInvalid',
      desc: '',
      args: [],
    );
  }

  String get errorMasterCodeConfirmation {
    return Intl.message(
      'Master code not identical',
      name: 'errorMasterCodeConfirmation',
      desc: '',
      args: [],
    );
  }

  String get masterCodeSaved {
    return Intl.message(
      'Master code saved',
      name: 'masterCodeSaved',
      desc: '',
      args: [],
    );
  }

  String get biometricsRequestTitle {
    return Intl.message(
      'You can also connect with your biometrics data',
      name: 'biometricsRequestTitle',
      desc: '',
      args: [],
    );
  }

  String get biometricsRequestDialog {
    return Intl.message(
      'Scan your biometric to authenticate',
      name: 'biometricsRequestDialog',
      desc: '',
      args: [],
    );
  }

  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  String get biometricsLater {
    return Intl.message(
      'You can add biometric authentication later in the profile',
      name: 'biometricsLater',
      desc: '',
      args: [],
    );
  }

  String get errorBiometricsAuthentication {
    return Intl.message(
      'Impossible to connect you with biometric data',
      name: 'errorBiometricsAuthentication',
      desc: '',
      args: [],
    );
  }

  String get errorBiometricsUnavailable {
    return Intl.message(
      'Biometric unavailable',
      name: 'errorBiometricsUnavailable',
      desc: '',
      args: [],
    );
  }

  String get profileBiometricSwitch {
    return Intl.message(
      'Biometric enable',
      name: 'profileBiometricSwitch',
      desc: '',
      args: [],
    );
  }

  String get updateMasterCode {
    return Intl.message(
      'Update master code',
      name: 'updateMasterCode',
      desc: '',
      args: [],
    );
  }

  String get updateMasterCodeSuccessTitle {
    return Intl.message(
      'Master code updated',
      name: 'updateMasterCodeSuccessTitle',
      desc: '',
      args: [],
    );
  }

  String get updateMasterCodeSuccessMessage {
    return Intl.message(
      'Your master code has been updated successfully.',
      name: 'updateMasterCodeSuccessMessage',
      desc: '',
      args: [],
    );
  }

  String get currentMasterCode {
    return Intl.message(
      'Current master code',
      name: 'currentMasterCode',
      desc: '',
      args: [],
    );
  }

  String get newMasterCode {
    return Intl.message(
      'New master code',
      name: 'newMasterCode',
      desc: '',
      args: [],
    );
  }

  String get updateMasterCodeErrorTitle {
    return Intl.message(
      'Wrong current master code',
      name: 'updateMasterCodeErrorTitle',
      desc: '',
      args: [],
    );
  }

  String get passwordGenerator {
    return Intl.message(
      'Password generator',
      name: 'passwordGenerator',
      desc: '',
      args: [],
    );
  }

  String get copy {
    return Intl.message(
      'Copy',
      name: 'copy',
      desc: '',
      args: [],
    );
  }

  String get generate {
    return Intl.message(
      'Generate',
      name: 'generate',
      desc: '',
      args: [],
    );
  }

  String get length {
    return Intl.message(
      'Length',
      name: 'length',
      desc: '',
      args: [],
    );
  }

  String get symbols {
    return Intl.message(
      'Symbols',
      name: 'symbols',
      desc: '',
      args: [],
    );
  }

  String get numbers {
    return Intl.message(
      'Numbers',
      name: 'numbers',
      desc: '',
      args: [],
    );
  }

  String get lowercase {
    return Intl.message(
      'Lowercase',
      name: 'lowercase',
      desc: '',
      args: [],
    );
  }

  String get uppercase {
    return Intl.message(
      'Uppercase',
      name: 'uppercase',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'symbolsInfo' key

  String get importIds {
    return Intl.message(
      'Import IDs',
      name: 'importIds',
      desc: '',
      args: [],
    );
  }

  String get selectFile {
    return Intl.message(
      'Select a file',
      name: 'selectFile',
      desc: '',
      args: [],
    );
  }

  String get importIdsSuccess {
    return Intl.message(
      'IDs successfully imported',
      name: 'importIdsSuccess',
      desc: '',
      args: [],
    );
  }

  String get importIdsError {
    return Intl.message(
      'Error while importing IDs',
      name: 'importIdsError',
      desc: '',
      args: [],
    );
  }

  String get importIdsErrorExists {
    return Intl.message(
      'IDs already exist',
      name: 'importIdsErrorExists',
      desc: '',
      args: [],
    );
  }

  String get importIdsFile {
    return Intl.message(
      'File',
      name: 'importIdsFile',
      desc: '',
      args: [],
    );
  }

  String get exportIds {
    return Intl.message(
      'Export IDs',
      name: 'exportIds',
      desc: '',
      args: [],
    );
  }

  String get exportIdsSuccess {
    return Intl.message(
      'IDs successfully exported in download folder',
      name: 'exportIdsSuccess',
      desc: '',
      args: [],
    );
  }

  String get exportIdsError {
    return Intl.message(
      'Error while exporting IDs',
      name: 'exportIdsError',
      desc: '',
      args: [],
    );
  }

  String get importExportIds {
    return Intl.message(
      'Import / Export IDs',
      name: 'importExportIds',
      desc: '',
      args: [],
    );
  }

  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  String get none {
    return Intl.message(
      'None',
      name: 'none',
      desc: '',
      args: [],
    );
  }

  String get import {
    return Intl.message(
      'Import',
      name: 'import',
      desc: '',
      args: [],
    );
  }

  String get export {
    return Intl.message(
      'Export',
      name: 'export',
      desc: '',
      args: [],
    );
  }

  String get chooseFile {
    return Intl.message(
      'Choose a file',
      name: 'chooseFile',
      desc: '',
      args: [],
    );
  }

  String get successful {
    return Intl.message(
      'Successful',
      name: 'successful',
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