class Validators {

  // ============================================
  // EMAIL VALIDATION
  // ============================================

  static String? validateEmail(
    String? value,
  ) {

    if (value == null ||
        value.trim().isEmpty) {

      return "Email is required";
    }

    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (!emailRegex.hasMatch(value)) {

      return "Enter valid email";
    }

    return null;
  }

  // ============================================
  // PASSWORD VALIDATION
  // ============================================

  static String? validatePassword(
    String? value,
  ) {

    if (value == null ||
        value.trim().isEmpty) {

      return "Password is required";
    }

    if (value.length < 6) {

      return "Minimum 6 characters";
    }

    return null;
  }

  // ============================================
  // NAME VALIDATION
  // ============================================

  static String? validateName(
    String? value,
  ) {

    if (value == null ||
        value.trim().isEmpty) {

      return "Name is required";
    }

    return null;
  }

  // ============================================
  // PROMPT VALIDATION
  // ============================================

  static String? validatePrompt(
    String? value,
  ) {

    if (value == null ||
        value.trim().isEmpty) {

      return "Prompt is required";
    }

    if (value.length < 5) {

      return "Prompt too short";
    }

    return null;
  }
}