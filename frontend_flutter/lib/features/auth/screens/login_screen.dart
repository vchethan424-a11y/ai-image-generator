import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

import '../widgets/auth_textfield.dart';

import 'signup_screen.dart';

import '../../home/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {
  final TextEditingController
      emailController =
      TextEditingController();

  final TextEditingController
      passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),

      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.all(24),

            child: Consumer<AuthProvider>(
              builder:
                  (context, provider, child) {
                return Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [
                    const Text(
                      "AI Image Generator",

                      style: TextStyle(
                        fontSize: 32,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 40),

                    AuthTextField(
                      controller:
                          emailController,

                      hintText: "Email",

                      icon: Icons.email,
                    ),

                    const SizedBox(height: 20),

                    AuthTextField(
                      controller:
                          passwordController,

                      hintText: "Password",

                      icon: Icons.lock,

                      obscureText: true,
                    ),

                    const SizedBox(height: 30),

                    ElevatedButton(
                      onPressed: () async {

  try {

    final success =
        await provider.login(
      email: emailController.text,

      password:
          passwordController.text,
    );

    if (!context.mounted) {
      return;
    }

    if (success) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              const HomeScreen(),
        ),
      );
    }

  } catch (e) {

    if (!context.mounted) {
      return;
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(
          e.toString(),
        ),
      ),
    );
  }
},

                      child: provider.isLoading
                          ? const CircularProgressIndicator()
                          : const Text(
                              "Login",
                            ),
                    ),

                    const SizedBox(height: 20),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    const SignupScreen(),
                          ),
                        );
                      },

                      child: const Text(
                        "Create Account",
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}