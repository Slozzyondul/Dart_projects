import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        children: [
          // Image first on mobile in HTML it says order-1 for image on mobile?
          // HTML: order-2 for text, order-1 for image on mobile.
          // Wait, HTML says:
          // <div class="... grid-cols-1 md:grid-cols-2 ...">
          //   <div class="... order-2 md:order-1">Text</div>
          //   <div class="order-1 md:order-2">Image</div>
          // </div>
          // So on mobile (default), Image is Order 1 (top), Text is Order 2 (bottom).
          // On Desktop (md), Text is Order 1 (left), Image is Order 2 (right).

          // Let's stick to mobile layout for simplicity or use a Wrap/Flex with direction.
          // I'll implement the mobile order: Image then Text.
          Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/17th_of_december.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'WORSHIP MINISTER & STORYTELLER',
                style: AppStyles.sansDisplay.copyWith(
                  color: AppColors.warmTaupe,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'I use music and stories to bring people hope, healing and encouragement through Christ.',
                style: AppStyles.serifDisplay.copyWith(
                  fontSize: 32,
                  height: 1.2,
                  color: AppColors.charcoalGrey,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Christian content creator, worship leader, singer-songwriter, and digital ministry entrepreneur dedicated to building faith-based communities.',
                style: AppStyles.sansDisplay.copyWith(
                  fontSize: 18,
                  color: AppColors.stone600,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.warmTaupe,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Watch Latest Worship',
                      style: AppStyles.sansDisplay.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.warmTaupe,
                      side: const BorderSide(
                        color: AppColors.warmTaupe,
                        width: 2,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Join Community',
                      style: AppStyles.sansDisplay.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
