import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/features/home/components/quote_placeholder.dart';
import 'package:flutter/material.dart';

class MotivationalQuotesSection extends StatelessWidget {
  const MotivationalQuotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.softBeige,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      child: Column(
        children: [
          // Simplified grid for quotes - just showing one or stacking them
          const QuotePlaceholder(),
          const SizedBox(height: 24),
          const QuotePlaceholder(),
          const SizedBox(height: 24),
          const QuotePlaceholder(),
        ],
      ),
    );
  }
}
