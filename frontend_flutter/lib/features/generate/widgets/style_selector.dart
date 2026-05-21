import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';

class StyleSelector extends StatelessWidget {
  final String selectedStyle;

  final Function(String) onChanged;

  const StyleSelector({
    super.key,
    required this.selectedStyle,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,

      runSpacing: 10,

      children:
          AppConstants.imageStyles.map(
        (style) {
          final isSelected =
              selectedStyle == style;

          return GestureDetector(
            onTap: () {
              onChanged(style);
            },

            child: Container(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),

              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.deepPurple
                    : Colors.grey.shade800,

                borderRadius:
                    BorderRadius.circular(
                  30,
                ),
              ),

              child: Text(
                style,

                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}