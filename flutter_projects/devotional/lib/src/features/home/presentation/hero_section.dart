import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

import 'package:devotional/src/common_widgets/constants/app_sizes.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > AppSizes.tabletBreakpoint) {
            return _buildDesktopLayout(context);
          }
          return _buildMobileLayout(context);
        },
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 64),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WORSHIP MINISTER & STORYTELLER',
                    style: AppStyles.sansDisplay.copyWith(
                      color: AppColors.warmTaupe,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 2.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'I use music and stories to bring people hope, healing and encouragement through Christ.',
                    style: AppStyles.serifDisplay.copyWith(
                      fontSize: 56, // Larger for desktop
                      height: 1.1,
                      color: AppColors.charcoalGrey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Christian content creator, worship leader, singer-songwriter, and digital ministry entrepreneur dedicated to building faith-based communities.',
                    style: AppStyles.sansDisplay.copyWith(
                      fontSize: 20,
                      color: AppColors.stone600,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 48),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.warmTaupe,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 24,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Watch Latest Worship',
                          style: AppStyles.sansDisplay.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.warmTaupe,
                          side: const BorderSide(
                            color: AppColors.warmTaupe,
                            width: 2,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 24,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Join Community',
                          style: AppStyles.sansDisplay.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              constraints: const BoxConstraints(maxHeight: 600),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  'assets/images/17th_of_december.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}
