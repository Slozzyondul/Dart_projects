import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_sizes.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

class QuoteSection extends StatelessWidget {
  const QuoteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > AppSizes.tabletBreakpoint;

        return Container(
          width: double.infinity,
          color: AppColors.blueSky,
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 40 : 16,
            vertical: isDesktop ? 96 : 64,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth:
                    800, // Thinner for better readability of single quotes
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.format_quote,
                    color: AppColors.blueAccent,
                    size: isDesktop ? 64 : 48,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    '"The Lord is my strength and my shield; my heart trusts in him, and he helps me. My heart leaps for joy, and with my song I praise him."',
                    textAlign: TextAlign.center,
                    style: AppStyles.serifDisplay.copyWith(
                      fontSize: isDesktop ? 36 : 24,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue[900],
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    '— PSALM 28:7',
                    style: AppStyles.sansDisplay.copyWith(
                      color: Colors.blue[700],
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      fontSize: isDesktop ? 16 : 14,
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
