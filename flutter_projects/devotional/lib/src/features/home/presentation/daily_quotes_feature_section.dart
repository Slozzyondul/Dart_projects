import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:devotional/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DailyQuotesFeatureSection extends StatelessWidget {
  const DailyQuotesFeatureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.softBeige, // Match home background or use alternate
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                'DAILY DEVOTIONAL',
                style: AppStyles.sansDisplay.copyWith(
                  color: AppColors.quotesPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Start your day with Scripture and Prayer',
                textAlign: TextAlign.center,
                style: AppStyles.serifDisplay.copyWith(
                  fontSize: 36,
                  color: AppColors.charcoalGrey,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  'Join us each morning for a curated verse, a guided prayer, and a moment of reflection to center your heart.',
                  textAlign: TextAlign.center,
                  style: AppStyles.sansDisplay.copyWith(
                    fontSize: 18,
                    color: AppColors.charcoalGrey.withValues(alpha: 0.7),
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Feature Card
              InkWell(
                onTap: () {
                  context.push(AppRoute.quotes.path);
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 800),
                  decoration: BoxDecoration(
                    color: AppColors.skyBlue.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.skyBlue.withValues(alpha: 0.5),
                    ),
                  ),
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.auto_awesome,
                        color: AppColors.quotesPrimary,
                        size: 40,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        '"The Lord is my shepherd; I shall not want..."',
                        textAlign: TextAlign.center,
                        style: AppStyles.serifDisplay.copyWith(
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                          color: AppColors.charcoalGrey,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'READ TODAY\'S DEVOTIONAL',
                            style: AppStyles.sansDisplay.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: AppColors.quotesPrimary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: AppColors.quotesPrimary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
