import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final IconData icon;

  final String title;

  final String subtitle;

  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),

          borderRadius:
              BorderRadius.circular(24),
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            Container(
              padding:
                  const EdgeInsets.all(14),

              decoration: BoxDecoration(
                color: Colors.deepPurple,

                borderRadius:
                    BorderRadius.circular(
                  16,
                ),
              ),

              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              title,

              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              subtitle,

              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}