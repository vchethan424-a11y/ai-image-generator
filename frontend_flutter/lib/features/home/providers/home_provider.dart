import 'package:flutter/material.dart';

import '../../../core/services/storage_service.dart';

class HomeProvider extends ChangeNotifier {
  String username = "User";

  int credits = 0;

  bool isLoading = false;

  // ============================================
  // LOAD USER DATA
  // ============================================

  Future<void> loadUserData() async {
    try {
      isLoading = true;

      notifyListeners();

      final user =
          await StorageService.getUser();

      if (user != null) {
        username = user["name"] ?? "User";

        credits = user["credits"] ?? 0;
      }

      isLoading = false;

      notifyListeners();
    } catch (e) {
      isLoading = false;

      notifyListeners();
    }
  }

  // ============================================
  // UPDATE CREDITS
  // ============================================

  void updateCredits(int newCredits) {
    credits = newCredits;

    notifyListeners();
  }

  // ============================================
  // LOGOUT
  // ============================================

  Future<void> logout() async {
    await StorageService.logout();
  }
}