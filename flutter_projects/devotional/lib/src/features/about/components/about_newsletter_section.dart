import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:devotional/src/common_widgets/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AboutNewsletterSection extends StatelessWidget {
  const AboutNewsletterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppSizes.desktopBreakpoint;
        final horizontalPadding = isDesktop
            ? (constraints.maxWidth - 800) / 2
            : 24.0;

        return Container(
          color: AppColors.stone200,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding > 24 ? horizontalPadding : 24,
            vertical: isDesktop ? 120 : 80,
          ),
          child: Container(
            padding: EdgeInsets.all(isDesktop ? 64 : 32),
            decoration: BoxDecoration(
              color: AppColors.charcoalGrey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  'STAY CONNECTED',
                  style: AppStyles.sansDisplay.copyWith(
                    color: AppColors.warmTaupe,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Join our community of hope.',
                  textAlign: TextAlign.center,
                  style: AppStyles.serifDisplay.copyWith(
                    fontSize: isDesktop ? 40 : 32,
                    fontStyle: FontStyle.italic,
                    color: AppColors.softBeige,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Receive monthly letters of encouragement, digital ministry tips, and exclusive worship sessions from Lilly.',
                  textAlign: TextAlign.center,
                  style: AppStyles.sansDisplay.copyWith(
                    color: AppColors.softBeige.withValues(alpha: 0.7),
                    height: 1.6,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 48),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Your email address',
                          hintStyle: TextStyle(
                            color: AppColors.softBeige.withValues(alpha: 0.4),
                          ),
                          filled: true,
                          fillColor: Colors.white.withValues(alpha: 0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              color: Colors.white.withValues(alpha: 0.2),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              color: Colors.white.withValues(alpha: 0.2),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: AppColors.warmTaupe,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 20,
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.warmTaupe,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Text(
                            'SUBSCRIBE',
                            style: AppStyles.sansDisplay.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
