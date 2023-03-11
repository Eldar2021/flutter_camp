import 'dart:ui';

import 'package:flutter_camp_1/constants/app_constants/app_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppService {
  final SharedPreferences preferences;

  const AppService(this.preferences);

  Locale init() {
    final langCode = preferences.getString(AppConsts.languageCodeKey);
    final deviceLocalCode = window.locale.languageCode;

    if (langCode != null) {
      return Locale(langCode);
    } else if (deviceLocalCode == 'ky' ||
        deviceLocalCode == 'en' ||
        deviceLocalCode == 'ru') {
      return Locale(deviceLocalCode);
    } else {
      return const Locale('en');
    }
  }

  Future<void> cacheLocalCode(String localCode) async {
    preferences.setString(AppConsts.languageCodeKey, localCode);
  }
}
