import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DecorativeDivider extends StatelessWidget {
  const DecorativeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(0.2),
        const SizedBox(width: 8),
        _buildDot(0.4),
        const SizedBox(width: 8),
        _buildDot(0.2),
      ],
    );
  }

  Widget _buildDot(double alpha) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.quotesPrimary.withValues(alpha: alpha),
      ),
    );
  }
}
