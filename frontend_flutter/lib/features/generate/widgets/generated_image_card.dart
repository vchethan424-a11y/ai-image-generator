import 'package:flutter/material.dart';

class GeneratedImageCard
    extends StatelessWidget {

  final String imagePath;

  const GeneratedImageCard({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      width: double.infinity,

      decoration: BoxDecoration(

        borderRadius:
            BorderRadius.circular(20),

        color: Colors.grey.shade900,
      ),

      child: ClipRRect(

        borderRadius:
            BorderRadius.circular(20),

        child: Image.network(

          imagePath,

          fit: BoxFit.cover,

          loadingBuilder:
              (
                context,
                child,
                loadingProgress,
              ) {

            if (loadingProgress == null) {
              return child;
            }

            return const SizedBox(

              height: 300,

              child: Center(

                child:
                    CircularProgressIndicator(),
              ),
            );
          },

          errorBuilder:
              (
                context,
                error,
                stackTrace,
              ) {

            return const SizedBox(

              height: 300,

              child: Center(

                child: Text(
                  "Failed to load image",
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}