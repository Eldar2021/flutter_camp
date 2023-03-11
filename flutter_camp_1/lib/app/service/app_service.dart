import 'package:flutter/material.dart';
import 'package:flutter_camp_1/constants/app_constants/app_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppService {
  final SharedPreferences preferences;

  const AppService(this.preferences);

  Locale init() {
    final langCode = preferences.getString(AppConsts.languageCodeKey);
    return Locale(langCode ?? 'en');
  }
}
