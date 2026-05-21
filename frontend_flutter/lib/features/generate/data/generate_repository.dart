import '../../../core/constants/app_constants.dart';

import '../../../core/network/api_client.dart';

class GenerateRepository {
  // ============================================
  // GENERATE IMAGE
  // ============================================

  Future<dynamic> generateImage({
    required String prompt,
    required String style,
    required String token,
  }) async {
    return await ApiClient.postRequest(
      endpoint:
          AppConstants.generateEndpoint,

      token: token,

      body: {
        "prompt": prompt,
        "style": style,
      },
    );
  }
}