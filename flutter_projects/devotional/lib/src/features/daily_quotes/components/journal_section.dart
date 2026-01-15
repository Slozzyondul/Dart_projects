import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

class JournalSection extends StatelessWidget {
  const JournalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.quotesPrimary.withValues(alpha: 0.05),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.edit_note, color: AppColors.quotesPrimary),
              const SizedBox(width: 12),
              Text(
                'My Reflections',
                style: AppStyles.serifDisplay.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.quotesPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            maxLines: 6,
            decoration: InputDecoration(
              hintText: "Write what's on your heart today...",
              hintStyle: TextStyle(
                color: AppColors.quotesPrimary.withValues(alpha: 0.3),
              ),
              border: InputBorder.none,
            ),
            style: const TextStyle(color: AppColors.charcoalGrey),
          ),
          const SizedBox(height: 16),
          Container(
            height: 1,
            color: AppColors.quotesPrimary.withValues(alpha: 0.1),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'AUTO-SAVED TO YOUR JOURNAL',
                style: AppStyles.sansDisplay.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: AppColors.quotesPrimary.withValues(alpha: 0.4),
                ),
              ),
              const Icon(
                Icons.history,
                color: AppColors.quotesPrimary,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
