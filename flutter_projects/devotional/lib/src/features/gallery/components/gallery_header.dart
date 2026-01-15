import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

class GalleryHeader extends StatelessWidget {
  const GalleryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 800;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: isDesktop ? 80 : 48,
          ),
          child: Column(
            children: [
              Text(
                'Digital Sanctuary',
                style: AppStyles.serifDisplay.copyWith(
                  fontSize: isDesktop ? 56 : 36,
                  fontWeight: FontWeight.bold,
                  color: AppColors.charcoalGrey,
                ),
              ),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Text(
                  '"But those who hope in the Lord will renew their strength. They will soar on wings like eagles." — Isaiah 40:31',
                  textAlign: TextAlign.center,
                  style: AppStyles.sansDisplay.copyWith(
                    fontSize: isDesktop ? 18 : 16,
                    fontStyle: FontStyle.italic,
                    color: AppColors.galleryTaupe,
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
