class AppConstants {
  // ============================================
  // APP DETAILS
  // ============================================

  static const String appName = "AI Image Generator";

  // ============================================
  // API
  // ============================================

  static const String baseUrl = "http://localhost:8000";
  // ============================================
  // ENDPOINTS
  // ============================================

  static const String signupEndpoint = "/auth/signup";

  static const String loginEndpoint = "/auth/login";

  static const String generateEndpoint = "/generate";

  static const String historyEndpoint = "/history";

  static const String profileEndpoint = "/users/me";

  // ============================================
  // STORAGE KEYS
  // ============================================

  static const String tokenKey = "token";

  static const String userKey = "user";

  // ============================================
  // IMAGE STYLES
  // ============================================

  static const List<String> imageStyles = [
    "realistic",
    "anime",
    "cinematic",
    "3d_render",
    "cyberpunk",
    "fantasy",
    "cartoon",
    "watercolor",
    "oil_painting",
  ];
}