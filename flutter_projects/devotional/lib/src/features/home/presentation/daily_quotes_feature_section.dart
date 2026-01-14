import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_sizes.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:devotional/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DailyQuotesFeatureSection extends StatelessWidget {
  const DailyQuotesFeatureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isDesktop = screenWidth > AppSizes.tabletBreakpoint;

        return Container(
          color: AppColors.softBeige,
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 40 : 16,
            vertical: isDesktop ? 120 : 80,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSizes.maxContentWidth,
              ),
              child: Column(
                children: [
                  Text(
                    'DAILY DEVOTIONAL',
                    style: AppStyles.sansDisplay.copyWith(
                      color: AppColors.quotesPrimary,
                      fontSize: isDesktop ? 16 : 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Start your day with Scripture and Prayer',
                    textAlign: TextAlign.center,
                    style: AppStyles.serifDisplay.copyWith(
                      fontSize: isDesktop ? 48 : 36,
                      color: AppColors.charcoalGrey,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: Text(
                      'Join us each morning for a curated verse, a guided prayer, and a moment of reflection to center your heart.',
                      textAlign: TextAlign.center,
                      style: AppStyles.sansDisplay.copyWith(
                        fontSize: isDesktop ? 20 : 18,
                        color: AppColors.charcoalGrey.withValues(alpha: 0.7),
                        height: 1.6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 64),
                  // Feature Card
                  InkWell(
                    onTap: () {
                      context.push(AppRoute.quotes.path);
                    },
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(maxWidth: 800),
                      decoration: BoxDecoration(
                        color: AppColors.skyBlue.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: AppColors.skyBlue.withValues(alpha: 0.4),
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(isDesktop ? 64 : 40),
                      child: Column(
                        children: [
                          Icon(
                            Icons.auto_awesome,
                            color: AppColors.quotesPrimary,
                            size: isDesktop ? 48 : 40,
                          ),
                          const SizedBox(height: 32),
                          Text(
                            '"The Lord is my shepherd; I shall not want..."',
                            textAlign: TextAlign.center,
                            style: AppStyles.serifDisplay.copyWith(
                              fontSize: isDesktop ? 32 : 24,
                              fontStyle: FontStyle.italic,
                              color: AppColors.charcoalGrey,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 48),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'READ TODAY\'S DEVOTIONAL',
                                style: AppStyles.sansDisplay.copyWith(
                                  fontSize: isDesktop ? 16 : 14,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  color: AppColors.quotesPrimary,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward,
                                size: isDesktop ? 20 : 16,
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
      },
    );
  }
}
