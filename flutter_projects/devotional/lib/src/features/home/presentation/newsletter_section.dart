import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

class NewsletterSection extends StatelessWidget {
  const NewsletterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.stone200,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
      child: Column(
        children: [
          Text(
            'Stay Connected',
            style: AppStyles.serifDisplay.copyWith(
              fontSize: 32,
              color: AppColors.charcoalGrey,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Join the faith community and receive weekly encouragement, worship updates, and new story releases directly to your inbox.',
            textAlign: TextAlign.center,
            style: AppStyles.sansDisplay.copyWith(
              color: AppColors.stone600,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          TextField(
            decoration: InputDecoration(
              hintText: 'Your email address',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.warmTaupe,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Subscribe Now',
                style: AppStyles.sansDisplay.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
