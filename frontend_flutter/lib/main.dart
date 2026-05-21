import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';

import 'core/services/storage_service.dart';

import 'routes/app_routes.dart';

import 'features/auth/screens/login_screen.dart';

import 'features/home/screens/home_screen.dart';

import 'shared/providers/app_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final token =
      await StorageService.getToken();

  runApp(
    MyApp(
      isLoggedIn: token != null,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({
    super.key,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppProvider(),
        ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: "AI Image Generator",

        theme: AppTheme.darkTheme,

        routes: AppRoutes.routes,

        home: isLoggedIn
            ? const HomeScreen()
            : const LoginScreen(),
      ),
    );
  }
}