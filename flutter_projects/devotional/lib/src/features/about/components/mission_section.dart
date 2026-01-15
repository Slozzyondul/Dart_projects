import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:devotional/src/common_widgets/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class MissionSection extends StatelessWidget {
  const MissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppSizes.desktopBreakpoint;

        return Container(
          color: AppColors.stone200, // beige-medium
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: isDesktop ? 120 : 80,
          ),
          width: double.infinity,
          child: Column(
            children: [
              const Icon(
                Icons.auto_awesome,
                color: AppColors.warmTaupe,
                size: 40,
              ),
              const SizedBox(height: 24),
              Text(
                'Personal Mission',
                style: AppStyles.serifDisplay.copyWith(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  color: AppColors.charcoalGrey,
                ),
              ),
              const SizedBox(height: 24),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Text(
                  '"Bringing hope and healing through Christ to every screen and every soul."',
                  textAlign: TextAlign.center,
                  style: AppStyles.sansDisplay.copyWith(
                    fontSize: isDesktop ? 36 : 28,
                    fontWeight: FontWeight.w300,
                    color: AppColors.charcoalGrey,
                    height: 1.3,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Container(width: 64, height: 1, color: AppColors.warmTaupe),
            ],
          ),
        );
      },
    );
  }
}
