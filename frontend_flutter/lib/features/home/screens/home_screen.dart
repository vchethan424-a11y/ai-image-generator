import 'package:flutter/material.dart';

import '../../../core/services/storage_service.dart';

import '../../auth/screens/login_screen.dart';

import '../../generate/screens/generate_screen.dart';

import '../../history/screens/history_screen.dart';

import '../widgets/feature_card.dart';
import '../widgets/home_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {
  String username = "User";

  int credits = 0;

  @override
  void initState() {
    super.initState();

    loadUser();
  }

  // ============================================
  // LOAD USER
  // ============================================

  Future<void> loadUser() async {
    final user =
        await StorageService.getUser();

    if (user != null) {
      setState(() {
        username = user["name"];

        credits = user["credits"];
      });
    }
  }

  // ============================================
  // LOGOUT
  // ============================================

  Future<void> logout() async {
    await StorageService.logout();

    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) =>
              const LoginScreen(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "AI Image Generator",
        ),

        actions: [
          IconButton(
            onPressed: logout,

            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                HomeHeader(
                  username: username,
                  credits: credits,
                ),

                const SizedBox(height: 30),

                const Text(
                  "Features",

                  style: TextStyle(
                    fontSize: 26,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                GridView.count(
                  shrinkWrap: true,

                  physics:
                      const NeverScrollableScrollPhysics(),

                  crossAxisCount: 2,

                  crossAxisSpacing: 16,

                  mainAxisSpacing: 16,

                  childAspectRatio: 0.9,

                  children: [
                    FeatureCard(
                      icon:
                          Icons.auto_awesome,

                      title: "Generate",

                      subtitle:
                          "Create AI generated images",

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    const GenerateScreen(),
                          ),
                        );
                      },
                    ),

                    FeatureCard(
                      icon: Icons.history,

                      title: "History",

                      subtitle:
                          "View previous generated images",

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    const HistoryScreen(),
                          ),
                        );
                      },
                    ),

                    FeatureCard(
                      icon: Icons.image,

                      title: "Styles",

                      subtitle:
                          "Explore multiple AI art styles",

                      onTap: () {},
                    ),

                    FeatureCard(
                      icon: Icons.person,

                      title: "Profile",

                      subtitle:
                          "Manage account settings",

                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}