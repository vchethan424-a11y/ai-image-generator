import 'package:flutter/material.dart';

class AppUtils {

  // ============================================
  // SHOW SNACKBAR
  // ============================================

  static void showSnackBar({

    required BuildContext context,

    required String message,

    Color? backgroundColor,
  }) {

    ScaffoldMessenger.of(context)
        .showSnackBar(

      SnackBar(

        content: Text(message),

        backgroundColor:
            backgroundColor,
      ),
    );
  }

  // ============================================
  // HIDE KEYBOARD
  // ============================================

  static void hideKeyboard(
    BuildContext context,
  ) {

    FocusScope.of(context)
        .unfocus();
  }

  // ============================================
  // VALIDATE EMAIL
  // ============================================

  static bool isValidEmail(
    String email,
  ) {

    return RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(email);
  }
}