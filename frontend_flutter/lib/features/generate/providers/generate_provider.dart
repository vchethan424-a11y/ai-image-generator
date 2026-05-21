import 'package:flutter/material.dart';

import '../../../core/services/storage_service.dart';

import '../data/generate_repository.dart';

class GenerateProvider extends ChangeNotifier {
  final GenerateRepository _repository =
      GenerateRepository();

  bool isGenerating = false;

  String generatedImage = "";

  String selectedStyle = "realistic";

  // ============================================
  // CHANGE STYLE
  // ============================================

  void changeStyle(String style) {
    selectedStyle = style;

    notifyListeners();
  }

  // ============================================
  // GENERATE IMAGE
  // ============================================

  Future<void> generateImage({
    required String prompt,
  }) async {
    try {
      isGenerating = true;

      notifyListeners();

      final token =
          await StorageService.getToken();

      final response =
          await _repository.generateImage(
        prompt: prompt,
        style: selectedStyle,
        token: token ?? "",
      );

      generatedImage =
          response["data"]["image_url"];

      isGenerating = false;

      notifyListeners();
    } catch (e) {
      isGenerating = false;

      notifyListeners();

      rethrow;
    }
  }
}