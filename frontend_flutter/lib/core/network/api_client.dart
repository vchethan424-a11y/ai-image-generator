import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/app_constants.dart';

class ApiClient {
  // ============================================
  // GET REQUEST
  // ============================================

  static Future<dynamic> getRequest({
    required String endpoint,
    String? token,
  }) async {
    final response = await http.get(
      Uri.parse(
        "${AppConstants.baseUrl}$endpoint",
      ),
      headers: {
        "Content-Type": "application/json",
        if (token != null)
          "Authorization": "Bearer $token",
      },
    );

    return _handleResponse(response);
  }

  // ============================================
  // POST REQUEST
  // ============================================

  static Future<dynamic> postRequest({
    required String endpoint,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    final response = await http.post(
      Uri.parse(
        "${AppConstants.baseUrl}$endpoint",
      ),
      headers: {
        "Content-Type": "application/json",
        if (token != null)
          "Authorization": "Bearer $token",
      },
      body: jsonEncode(body),
    );

    return _handleResponse(response);
  }

  // ============================================
  // DELETE REQUEST
  // ============================================

  static Future<dynamic> deleteRequest({
    required String endpoint,
    String? token,
  }) async {
    final response = await http.delete(
      Uri.parse(
        "${AppConstants.baseUrl}$endpoint",
      ),
      headers: {
        "Content-Type": "application/json",
        if (token != null)
          "Authorization": "Bearer $token",
      },
    );

    return _handleResponse(response);
  }

  // ============================================
  // RESPONSE HANDLER
  // ============================================

  static dynamic _handleResponse(
    http.Response response,
  ) {
    final data = jsonDecode(response.body);

    if (response.statusCode >= 200 &&
        response.statusCode < 300) {
      return data;
    } else {
      throw Exception(
        data["detail"] ??
            "Something went wrong",
      );
    }
  }
}