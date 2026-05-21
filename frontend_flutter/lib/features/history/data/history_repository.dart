import '../../../core/constants/app_constants.dart';

import '../../../core/network/api_client.dart';

class HistoryRepository {
  // ============================================
  // GET HISTORY
  // ============================================

  Future<dynamic> getHistory({
    required String token,
  }) async {
    return await ApiClient.getRequest(
      endpoint:
          AppConstants.historyEndpoint,

      token: token,
    );
  }

  // ============================================
  // DELETE HISTORY
  // ============================================

  Future<dynamic> deleteHistory({
    required int imageId,
    required String token,
  }) async {
    return await ApiClient.deleteRequest(
      endpoint:
          "${AppConstants.historyEndpoint}/$imageId",

      token: token,
    );
  }
}