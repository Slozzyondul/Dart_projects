import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

class GalleryFilterBar extends StatelessWidget {
  const GalleryFilterBar({super.key});

  static const List<String> _filters = [
    'All Collections',
    'Daily Devotion',
    'Scripture Art',
    'Minimalist Hope',
    'Gratitude',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 40),
      child: Row(
        children: _filters.map((filter) {
          final isSelected = filter == 'All Collections';
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.galleryPrimary
                    : AppColors.galleryTaupe.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(100),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: AppColors.galleryPrimary.withValues(
                            alpha: 0.2,
                          ),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Text(
                filter,
                style: AppStyles.sansDisplay.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : AppColors.galleryTaupe,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
