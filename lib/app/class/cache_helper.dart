import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

  static late SharedPreferences _sharedPreferences;
  static   bool ?themeValue;
  static bool ? isEnglish;


  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }


  static dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }

  static Future<bool?> setData(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      return await _sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await _sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return await _sharedPreferences.setInt(key, value);
    }
    if (value is double) {
      return await _sharedPreferences.setDouble(key, value);
    }
    return null;

  }
  static Future<bool?> removeData({required String key})async{
    return await _sharedPreferences.remove(key);
  }
}

