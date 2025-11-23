import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  // This static variable will hold the instance
  static late SharedPreferences sharedPreferences;

  // 1. Initialize the cache (call this in main.dart)
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // 2. Generic method to save data (String, bool, int, double)
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is double) return await sharedPreferences.setDouble(key, value);

    return false;
  }

  // 3. Method to get data
  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  // 4. Method to remove data
  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }
}