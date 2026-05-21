import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String username;

  final int credits;

  const HomeHeader({
    super.key,
    required this.username,
    required this.credits,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF7C3AED),
            Color(0xFF4F46E5),
          ],
        ),

        borderRadius:
            BorderRadius.circular(28),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          Text(
            "Welcome Back 👋",

            style: TextStyle(
              color: Colors.white.withValues(
                alpha: 0.9,
              ),

              fontSize: 18,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            username,

            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          Container(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 12,
            ),

            decoration: BoxDecoration(
              color: Colors.white.withValues(
                alpha: 0.15,
              ),

              borderRadius:
                  BorderRadius.circular(20),
            ),

            child: Row(
              mainAxisSize: MainAxisSize.min,

              children: [
                const Icon(
                  Icons.bolt,
                  color: Colors.amber,
                ),

                const SizedBox(width: 10),

                Text(
                  "$credits Credits Remaining",

                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight:
                        FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}