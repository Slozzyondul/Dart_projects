import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.softBeige,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Lilly Bosek',
              style: AppStyles.serifDisplay.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.warmTaupe,
              ),
            ),
            // Desktop Nav (Hidden on mobile for simplicity, or we can use LayoutBuilder)
            // For now, implementing the mobile view primarily as per standard Flutter practice,
            // but adding the button as it's prominent.
            Row(
              children: [
                // Hidden nav items for simplicity in this first pass, or add if needed.
                // The HTML has a hidden menu for mobile and full nav for desktop.
                // We'll just show the button for now or a menu icon.
                IconButton(
                  icon: const Icon(Icons.menu, color: AppColors.charcoalGrey),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
