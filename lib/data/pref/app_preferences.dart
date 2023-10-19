import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  //region AppPref setup
  Future? _isPreferenceInstanceReady;
  late SharedPreferences _preferences;

  static final AppPref _instance = AppPref._internal();

  factory AppPref() => _instance;

  AppPref._internal() {
    _isPreferenceInstanceReady = SharedPreferences.getInstance()
        .then((preferences) => _preferences = preferences);
  }

  Future? get isPreferenceReady => _isPreferenceInstanceReady;

  //endregion setup

  /// to find FIREBASE messaging token
  String get fcmToken => _preferences.getString('fcmToken') ?? '';
  set fcmToken(String value) => _preferences.setString('fcmToken', value);

  /// retrieve app current language
  String get languageCode => _preferences.getString('languageCode') ?? '';

  set languageCode(String value) =>
      _preferences.setString('languageCode', value);



  ///washing app-------------------------------------------------
  bool get login => _preferences.getBool('login') ?? false;
  set login(bool value) => _preferences.setBool('login', value);
  String get remember => _preferences.getString('remember') ?? '';
  set remember(String value) => _preferences.setString('remember', value);


  String get userData => _preferences.getString('userData') ?? '';
  set userData(String value) => _preferences.setString('userData', value);

  String get uid => _preferences.getString('uid') ?? '';
  set uid(String value) => _preferences.setString('uid', value);
  void clear() async {
    _preferences.clear();
  }
}
