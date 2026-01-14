import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

import 'package:devotional/src/common_widgets/constants/app_sizes.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _launchYouTube() async {
    final Uri url = Uri.parse(
      'https://www.youtube.com/@LavingtonVineyardChurch',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      // Fallback or error handling if needed, but for now silent failure or log is standard
      debugPrint('Could not launch \$url');
    }
  }

  Future<void> _launchWhatsApp() async {
    final Uri url = Uri.parse(
      'https://wa.me/2547704173734?text=Hello%2C%20I%20would%20like%20to%20request%20to%20join%20the%20community.',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch \$url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isDesktop = screenWidth > AppSizes.tabletBreakpoint;

        return Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 40 : 16,
            vertical: isDesktop ? 96 : 48,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSizes.maxContentWidth,
              ),
              child: isDesktop
                  ? _buildDesktopLayout(context)
                  : _buildMobileLayout(context, screenWidth),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
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
                    fontSize: 56,
                    height: 1.1,
                    color: AppColors.charcoalGrey,
                  ),
                ),
                const SizedBox(height: 32),
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
                      onPressed: _launchYouTube,
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
                      onPressed: _launchWhatsApp,
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
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                'assets/images/17th_of_december.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, double screenWidth) {
    final isTablet = screenWidth > AppSizes.mobileBreakpoint;

    return Column(
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: isTablet ? 600 : double.infinity,
            maxHeight: isTablet ? 450 : 400,
          ),
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              'assets/images/17th_of_december.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 48),
        Column(
          crossAxisAlignment: isTablet
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Text(
              'WORSHIP MINISTER & STORYTELLER',
              textAlign: isTablet ? TextAlign.center : TextAlign.start,
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
              textAlign: isTablet ? TextAlign.center : TextAlign.start,
              style: AppStyles.serifDisplay.copyWith(
                fontSize: isTablet ? 48 : 36,
                height: 1.2,
                color: AppColors.charcoalGrey,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Christian content creator, worship leader, singer-songwriter, and digital ministry entrepreneur dedicated to building faith-based communities.',
              textAlign: isTablet ? TextAlign.center : TextAlign.start,
              style: AppStyles.sansDisplay.copyWith(
                fontSize: 18,
                color: AppColors.stone600,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _launchYouTube,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.warmTaupe,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 20,
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
                    onPressed: _launchWhatsApp,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.warmTaupe,
                      side: const BorderSide(
                        color: AppColors.warmTaupe,
                        width: 2,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 20,
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
            ),
          ],
        ),
      ],
    );
  }
}
