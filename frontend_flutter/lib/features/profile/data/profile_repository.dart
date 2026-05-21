import '../../../core/constants/app_constants.dart';

import '../../../core/network/api_client.dart';

class ProfileRepository {
  // ============================================
  // GET PROFILE
  // ============================================

  Future<dynamic> getProfile({
    required String token,
  }) async {
    return await ApiClient.getRequest(
      endpoint:
          AppConstants.profileEndpoint,

      token: token,
    );
  }
}