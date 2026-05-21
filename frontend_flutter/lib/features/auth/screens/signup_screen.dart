import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

import '../widgets/auth_textfield.dart';

import '../../home/screens/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() =>
      _SignupScreenState();
}

class _SignupScreenState
    extends State<SignupScreen> {
  final TextEditingController
      nameController =
      TextEditingController();

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
        appBar: AppBar(),

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
                      "Create Account",

                      style: TextStyle(
                        fontSize: 30,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 40),

                    AuthTextField(
                      controller:
                          nameController,

                      hintText: "Name",

                      icon: Icons.person,
                    ),

                    const SizedBox(height: 20),

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
        await provider.signup(
      name: nameController.text,

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
                              "Signup",
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