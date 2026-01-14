import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

class ExpertiseCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ExpertiseCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.warmTaupe.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.warmTaupe, size: 32),
          const SizedBox(height: 16),
          Text(
            title,
            style: AppStyles.sansDisplay.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.charcoalGrey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppStyles.sansDisplay.copyWith(
              fontSize: 14,
              color: AppColors.charcoalGrey.withValues(alpha: 0.7),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
