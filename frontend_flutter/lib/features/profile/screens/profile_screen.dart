import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/profile_provider.dart';

import '../widgets/profile_info_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState
    extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          ProfileProvider()
            ..loadProfile(),

      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile",
          ),
        ),

        body: Consumer<ProfileProvider>(
          builder:
              (context, provider, child) {
            if (provider.isLoading) {
              return const Center(
                child:
                    CircularProgressIndicator(),
              );
            }

            if (provider.profile == null) {
              return const Center(
                child: Text(
                  "Failed to load profile",
                ),
              );
            }

            final profile =
                provider.profile!;

            return SingleChildScrollView(
              padding:
                  const EdgeInsets.all(20),

              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 55,

                    backgroundColor:
                        Colors.deepPurple,

                    child: Icon(
                      Icons.person,

                      size: 55,

                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    profile.name,

                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    profile.email,

                    style: TextStyle(
                      color:
                          Colors.grey.shade400,

                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 35),

                  ProfileInfoCard(
                    icon: Icons.email,

                    title: "Email",

                    value: profile.email,
                  ),

                  ProfileInfoCard(
                    icon: Icons.bolt,

                    title: "Credits",

                    value:
                        "${profile.credits}",
                  ),

                  ProfileInfoCard(
                    icon: Icons.calendar_today,

                    title: "Created At",

                    value:
                        profile.createdAt,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}