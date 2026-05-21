import 'package:flutter/material.dart';

class PromptInput extends StatelessWidget {
  final TextEditingController controller;

  const PromptInput({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      maxLines: 5,

      decoration: InputDecoration(
        hintText:
            "Describe the image you want to generate...",

        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(16),
        ),
      ),
    );
  }
}