import 'package:flutter/material.dart';

class CustomSnackbar {
  // ============================================
  // SUCCESS
  // ============================================

  static void success(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(message),

        backgroundColor: Colors.green,
      ),
    );
  }

  // ============================================
  // ERROR
  // ============================================

  static void error(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(message),

        backgroundColor: Colors.red,
      ),
    );
  }
}