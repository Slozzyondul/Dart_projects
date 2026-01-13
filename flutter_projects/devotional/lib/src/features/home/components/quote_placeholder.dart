import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

class QuotePlaceholder extends StatelessWidget {
  const QuotePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(color: AppColors.stone100, width: 4),
        ),
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.stone50,
            border: Border.all(
              color: AppColors.stone300,
              style: BorderStyle.solid,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.image, size: 48, color: AppColors.stone400),
              const SizedBox(height: 8),
              Text(
                'MOTIVATIONAL QUOTE PNG',
                style: AppStyles.sansDisplay.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.stone400,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '1080 x 1080',
                style: AppStyles.sansDisplay.copyWith(
                  fontSize: 10,
                  color: AppColors.stone400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
