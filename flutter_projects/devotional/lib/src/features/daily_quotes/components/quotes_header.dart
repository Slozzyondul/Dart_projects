import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

class QuotesHeader extends StatelessWidget {
  const QuotesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DAILY DEVOTIONAL',
          style: AppStyles.sansDisplay.copyWith(
            color: AppColors.quotesPrimary.withValues(alpha: 0.6),
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Monday, October 23rd',
          style: AppStyles.serifDisplay.copyWith(
            color: AppColors.charcoalGrey,
            fontSize: 48,
            fontWeight: FontWeight.w900,
            height: 1.1,
          ),
        ),
      ],
    );
  }
}
