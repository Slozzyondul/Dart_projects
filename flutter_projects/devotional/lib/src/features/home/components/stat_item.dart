import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

class StatItem extends StatelessWidget {
  final String number;
  final String label;

  const StatItem({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: AppStyles.serifDisplay.copyWith(
            fontSize: 48,
            color: AppColors.warmTaupe,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppStyles.sansDisplay.copyWith(
            color: AppColors.stone400,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
