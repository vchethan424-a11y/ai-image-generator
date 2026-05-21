import 'package:flutter/material.dart';

import '../../../core/services/storage_service.dart';

import '../data/history_repository.dart';

import '../models/history_model.dart';

class HistoryProvider extends ChangeNotifier {
  final HistoryRepository _repository =
      HistoryRepository();

  bool isLoading = false;

  List<HistoryModel> historyList = [];

  // ============================================
  // FETCH HISTORY
  // ============================================

  Future<void> fetchHistory() async {
    try {
      isLoading = true;

      notifyListeners();

      final token =
          await StorageService.getToken();

      final response =
          await _repository.getHistory(
        token: token ?? "",
      );

      historyList =
          (response["data"] as List)
              .map(
                (item) =>
                    HistoryModel.fromJson(
                  item,
                ),
              )
              .toList();

      isLoading = false;

      notifyListeners();
    } catch (e) {
      isLoading = false;

      notifyListeners();

      rethrow;
    }
  }

  // ============================================
  // DELETE HISTORY
  // ============================================

  Future<void> deleteHistory(
    int imageId,
  ) async {
    try {
      final token =
          await StorageService.getToken();

      await _repository.deleteHistory(
        imageId: imageId,
        token: token ?? "",
      );

      historyList.removeWhere(
        (item) => item.id == imageId,
      );

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}