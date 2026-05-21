import 'package:flutter/material.dart';

import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/signup_screen.dart';

import '../features/home/screens/home_screen.dart';

import '../features/generate/screens/generate_screen.dart';

import '../features/history/screens/history_screen.dart';

import '../features/profile/screens/profile_screen.dart';

class AppRoutes {
  // ============================================
  // ROUTE NAMES
  // ============================================

  static const String login = "/login";

  static const String signup = "/signup";

  static const String home = "/home";

  static const String generate = "/generate";

  static const String history = "/history";

  static const String profile = "/profile";

  // ============================================
  // ROUTES
  // ============================================

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginScreen(),

    signup: (context) => const SignupScreen(),

    home: (context) => const HomeScreen(),

    generate: (context) =>
        const GenerateScreen(),

    history: (context) =>
        const HistoryScreen(),

    profile: (context) =>
        const ProfileScreen(),
  };
}