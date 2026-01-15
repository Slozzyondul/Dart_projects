import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

class GalleryLoadMore extends StatelessWidget {
  const GalleryLoadMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [
          Text(
            'Seeking more inspiration?',
            style: AppStyles.sansDisplay.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.galleryTaupe,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.galleryTaupe, width: 2),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              foregroundColor: AppColors.galleryTaupe,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'LOAD MORE QUOTES',
              style: AppStyles.sansDisplay.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
