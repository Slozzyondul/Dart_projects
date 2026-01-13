import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

class SmallProjectCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SmallProjectCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.stone50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.stone100),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: AppColors.blueSky,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.blue[600], size: 20),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.sansDisplay.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.charcoalGrey,
                ),
              ),
              Text(
                subtitle,
                style: AppStyles.sansDisplay.copyWith(
                  fontSize: 12,
                  color: AppColors.stone500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
