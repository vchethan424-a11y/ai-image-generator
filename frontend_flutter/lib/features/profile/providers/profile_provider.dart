import 'package:flutter/material.dart';

import '../../../core/services/storage_service.dart';

import '../data/profile_repository.dart';

import '../models/profile_model.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepository _repository =
      ProfileRepository();

  bool isLoading = false;

  ProfileModel? profile;

  // ============================================
  // LOAD PROFILE
  // ============================================

  Future<void> loadProfile() async {
    try {
      isLoading = true;

      notifyListeners();

      final token =
          await StorageService.getToken();

      final response =
          await _repository.getProfile(
        token: token ?? "",
      );

      profile = ProfileModel.fromJson(
        response["data"],
      );

      isLoading = false;

      notifyListeners();
    } catch (e) {
      isLoading = false;

      notifyListeners();

      rethrow;
    }
  }
}