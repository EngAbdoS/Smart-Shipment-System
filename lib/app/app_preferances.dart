import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/resources/language_manager.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_ONBOARDING_SCREEN_VIEWED =
    "PREFS_KEY_ONBOARDING_SCREEN_VIEWED";
const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";
const String PREFS_KEY_USER_ROLE = "PREFS_KEY_USER_ROLE";
//const String PREFS_KEY_USER_TOKEN = "PREFS_KEY_USER_TOKEN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  ///////////////////user role////////////////////////

  setUserRole(String userRole) {
    _sharedPreferences.setString(PREFS_KEY_USER_ROLE, userRole);
  }

  getUserRole() {
    return _sharedPreferences.getString(PREFS_KEY_USER_ROLE);
  }

  removeUserRole() {
    _sharedPreferences.remove(PREFS_KEY_USER_ROLE);
  }


///////////////////logged in////////////////////////

  setLoggedIn() {
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }

  bool isLoggedIn() {
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  logout() {
    _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
    _sharedPreferences.remove(PREFS_KEY_USER_ROLE);
   // _sharedPreferences.remove(PREFS_KEY_USER_TOKEN);
  }

///////////////////on boarding////////////////////////

  setOnBoardingScreenViewed() {
    _sharedPreferences.setBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED, true);
  }

  bool isOnBoardingScreenViewed() {
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED) ??
        false;
  }

///////////////////user data////////////////////////
//   setUserToken(String token) {
//     _sharedPreferences.setString(PREFS_KEY_USER_TOKEN, token);
//   }
//
//  String  getUserToken() {
//     return _sharedPreferences.getString(PREFS_KEY_USER_TOKEN)??"";
//   }
//   removeUserToken() {
//     _sharedPreferences.remove(PREFS_KEY_USER_TOKEN);
//   }




///////////////////localization////////////////////////

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      /////////////////////////default language
      return LanguageType.ARABIC.getValue();
    }
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.ARABIC.getValue()) {
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
    }
  }

  Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }




}
