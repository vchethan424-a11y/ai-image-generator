import '../../../core/constants/app_constants.dart';
import '../../../core/network/api_client.dart';

class AuthRepository {
  // ============================================
  // SIGNUP
  // ============================================

  Future<dynamic> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    return await ApiClient.postRequest(
      endpoint:
          AppConstants.signupEndpoint,

      body: {
        "name": name,
        "email": email,
        "password": password,
      },
    );
  }

  // ============================================
  // LOGIN
  // ============================================

  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    return await ApiClient.postRequest(
      endpoint:
          AppConstants.loginEndpoint,

      body: {
        "email": email,
        "password": password,
      },
    );
  }
}