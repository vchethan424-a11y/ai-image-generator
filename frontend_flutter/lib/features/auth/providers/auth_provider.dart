import 'package:flutter/material.dart';

import '../../../core/services/storage_service.dart';

import '../data/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _repository =
      AuthRepository();

  bool isLoading = false;

  // ============================================
  // LOGIN
  // ============================================

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading = true;

      notifyListeners();

      final response =
          await _repository.login(
        email: email,
        password: password,
      );

      await StorageService.saveToken(
        response["access_token"],
      );

      await StorageService.saveUser(
        response["user"],
      );

      isLoading = false;

      notifyListeners();

      return true;
    } catch (e) {
      isLoading = false;

      notifyListeners();

      rethrow;
    }
  }

  // ============================================
  // SIGNUP
  // ============================================

  Future<bool> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      isLoading = true;

      notifyListeners();

      final response =
          await _repository.signup(
        name: name,
        email: email,
        password: password,
      );

      await StorageService.saveToken(
        response["access_token"],
      );

      await StorageService.saveUser(
        response["user"],
      );

      isLoading = false;

      notifyListeners();

      return true;
    } catch (e) {
      isLoading = false;

      notifyListeners();

      rethrow;
    }
  }
}