import 'package:flutter/material.dart';

import '../../core/services/storage_service.dart';

class AppProvider extends ChangeNotifier {
  bool isDarkMode = true;

  bool isLoggedIn = false;

  Map<String, dynamic>? currentUser;

  // ============================================
  // LOAD USER SESSION
  // ============================================

  Future<void> loadSession() async {
    final token =
        await StorageService.getToken();

    final user =
        await StorageService.getUser();

    if (token != null && user != null) {
      isLoggedIn = true;

      currentUser = user;
    } else {
      isLoggedIn = false;
    }

    notifyListeners();
  }

  // ============================================
  // UPDATE USER
  // ============================================

  void updateUser(
    Map<String, dynamic> user,
  ) {
    currentUser = user;

    notifyListeners();
  }

  // ============================================
  // LOGOUT
  // ============================================

  Future<void> logout() async {
    await StorageService.logout();

    isLoggedIn = false;

    currentUser = null;

    notifyListeners();
  }

  // ============================================
  // TOGGLE THEME
  // ============================================

  void toggleTheme() {
    isDarkMode = !isDarkMode;

    notifyListeners();
  }
}