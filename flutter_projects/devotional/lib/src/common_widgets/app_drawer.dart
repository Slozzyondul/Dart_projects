import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:devotional/src/common_widgets/constants/app_sizes.dart';
import 'package:devotional/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final drawerWidth = screenWidth > AppSizes.mobileBreakpoint
        ? AppSizes.drawerWidthTablet
        : AppSizes.drawerWidthMobile;

    return Drawer(
      width: drawerWidth,
      backgroundColor: AppColors.softBeige,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lilly Bosek',
                    style: AppStyles.serifDisplay.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.warmTaupe,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Digital Ministry & Worship',
                    style: AppStyles.sansDisplay.copyWith(
                      fontSize: 12,
                      color: AppColors.stone500,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: AppColors.stone200),
            const SizedBox(height: 16),
            _buildDrawerItem(
              context,
              label: 'Home',
              route: AppRoute.home,
              icon: Icons.home_outlined,
            ),
            _buildDrawerItem(
              context,
              label: 'About',
              route: AppRoute.about,
              icon: Icons.person_outline,
            ),
            _buildDrawerItem(
              context,
              label: 'Ministry',
              route: AppRoute
                  .gallery, // Mapping Ministry to Gallery for now as per router
              icon: Icons.church_outlined,
            ),
            _buildDrawerItem(
              context,
              label: 'Contact',
              route: AppRoute.contact,
              icon: Icons.mail_outline,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.galleryTaupe,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text(
                    'SUPPORT MISSION',
                    style: AppStyles.sansDisplay.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required String label,
    required AppRoute route,
    required IconData icon,
  }) {
    final currentPath = GoRouterState.of(context).uri.path;
    final isSelected = currentPath == route.path;

    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? AppColors.warmTaupe : AppColors.charcoalGrey,
      ),
      title: Text(
        label.toUpperCase(),
        style: AppStyles.sansDisplay.copyWith(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          color: isSelected ? AppColors.warmTaupe : AppColors.charcoalGrey,
          letterSpacing: 1.5,
          fontSize: 14,
        ),
      ),
      onTap: () {
        context.pop(); // Close drawer
        context.go(route.path);
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      selected: isSelected,
      selectedTileColor: AppColors.warmTaupe.withValues(alpha: 0.1),
    );
  }
}
