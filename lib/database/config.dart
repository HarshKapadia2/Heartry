import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../init_get_it.dart';

final configProvider = ChangeNotifierProvider<Config>((_) => locator<Config>());

class Config extends ChangeNotifier {
  static late SharedPreferences _sharedPrefs;

  static const String _nameKey = "name";
  static const String _profileKey = "profile";

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  set name(String? value) {
    if (value == null) return;

    _sharedPrefs.setString(_nameKey, value);
    notifyListeners();
  }

  String? get name => _sharedPrefs.getString(_nameKey);

  set profile(String? value) {
    if (value == null) {
      _sharedPrefs.remove(_profileKey);
      notifyListeners();

      return;
    }
    _sharedPrefs.setString(_profileKey, value);
    notifyListeners();
  }

  String? get profile => _sharedPrefs.getString(_profileKey);
}
