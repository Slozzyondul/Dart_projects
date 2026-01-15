import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

class PrayerSection extends StatelessWidget {
  const PrayerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Today's Prayer",
              style: AppStyles.serifDisplay.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.quotesPrimary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                height: 1,
                color: AppColors.quotesPrimary.withValues(alpha: 0.1),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPrayerParagraph(
              'Dear Heavenly Father, we come before You today with hearts open to Your guidance. Just as a shepherd leads his flock with patience and unyielding care, lead us beside still waters today. In the midst of the noise and the demands of our schedules, remind us that our identity is found in being Yours, not in our doing.',
            ),
            _buildPrayerParagraph(
              'Lord, restore our souls where they have become frayed or weary. We lay down our anxieties at Your feet, trusting that You provide exactly what we need for this day. May Your goodness and mercy follow us through every conversation, every task, and every moment of rest.',
            ),
            _buildPrayerParagraph(
              "Help us to hear Your voice above the world's clamor. Give us the courage to follow where You lead, knowing that Your paths are those of righteousness and peace. We rest in the assurance that we lack nothing when we are with You.",
            ),
            const SizedBox(height: 16),
            Text(
              'Amen.',
              style: AppStyles.sansDisplay.copyWith(
                fontSize: 18,
                color: AppColors.quotesPrimary,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPrayerParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Text(
        text,
        style: AppStyles.serifDisplay.copyWith(
          fontSize: 18,
          height: 1.8,
          color: AppColors.charcoalGrey.withValues(alpha: 0.8),
        ),
      ),
    );
  }
}
