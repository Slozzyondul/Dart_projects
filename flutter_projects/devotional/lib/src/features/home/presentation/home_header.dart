import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

import 'package:devotional/src/common_widgets/constants/app_sizes.dart';
import 'package:devotional/src/routing/app_router.dart';
import 'package:go_router/go_router.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blueSky,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = MediaQuery.of(context).size.width;
            final isDesktop = screenWidth > AppSizes.tabletBreakpoint;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Logo/Brand (could define as separate widget if needed)
                    Text(
                      'Lilly Bosek',
                      style: AppStyles.serifDisplay.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.warmTaupe, // From original design/impl
                      ),
                    ),
                  ],
                ),

                if (isDesktop)
                  Row(
                    children: [
                      _buildDesktopNavLink(context, 'Home', AppRoute.home),
                      const SizedBox(width: 32),
                      _buildDesktopNavLink(
                        context,
                        'Devotionals',
                        AppRoute.quotes,
                      ),
                      const SizedBox(width: 32),
                      _buildDesktopNavLink(
                        context,
                        'Ministry',
                        AppRoute.gallery,
                      ),
                      const SizedBox(width: 32),
                      _buildDesktopNavLink(context, 'About', AppRoute.about),
                      const SizedBox(width: 32),
                      IconButton(
                        onPressed: () {
                          // Route to profile or support?
                          // Design has a person icon button
                          context.push(AppRoute.contact.path);
                        },
                        icon: const Icon(
                          Icons.person,
                          color: AppColors.warmTaupe,
                        ),
                      ),
                    ],
                  )
                else
                  IconButton(
                    icon: const Icon(Icons.menu, color: AppColors.charcoalGrey),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDesktopNavLink(
    BuildContext context,
    String label,
    AppRoute route,
  ) {
    final currentPath = GoRouterState.of(context).uri.path;
    final isSelected = currentPath == route.path;

    return InkWell(
      onTap: () => context.go(route.path),
      child: Text(
        label,
        style: AppStyles.sansDisplay.copyWith(
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          color: isSelected
              ? AppColors.warmTaupe
              : AppColors.stone500, // Using stone500 for non-selected/muted
        ),
      ),
    );
  }
}
