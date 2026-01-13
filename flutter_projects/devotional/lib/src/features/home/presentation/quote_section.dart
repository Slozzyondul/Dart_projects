import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

class QuoteSection extends StatelessWidget {
  const QuoteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.blueSky,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
      child: Column(
        children: [
          const Icon(Icons.format_quote, color: AppColors.blueAccent, size: 48),
          const SizedBox(height: 24),
          Text(
            '"The Lord is my strength and my shield; my heart trusts in him, and he helps me. My heart leaps for joy, and with my song I praise him."',
            textAlign: TextAlign.center,
            style: AppStyles.serifDisplay.copyWith(
              fontSize: 24,
              fontStyle: FontStyle.italic,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '— PSALM 28:7',
            style: AppStyles.sansDisplay.copyWith(
              color: Colors.blue[700],
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
