import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

class StorageService {
  // ============================================
  // SAVE TOKEN
  // ============================================

  static Future<void> saveToken(
    String token,
  ) async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setString(
      AppConstants.tokenKey,
      token,
    );
  }

  // ============================================
  // GET TOKEN
  // ============================================

  static Future<String?> getToken() async {
    final prefs =
        await SharedPreferences.getInstance();

    return prefs.getString(
      AppConstants.tokenKey,
    );
  }

  // ============================================
  // SAVE USER
  // ============================================

  static Future<void> saveUser(
    Map<String, dynamic> user,
  ) async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setString(
      AppConstants.userKey,
      jsonEncode(user),
    );
  }

  // ============================================
  // GET USER
  // ============================================

  static Future<Map<String, dynamic>?>
      getUser() async {
    final prefs =
        await SharedPreferences.getInstance();

    final userString = prefs.getString(
      AppConstants.userKey,
    );

    if (userString == null) {
      return null;
    }

    return jsonDecode(userString);
  }

  // ============================================
  // LOGOUT
  // ============================================

  static Future<void> logout() async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.clear();
  }
}