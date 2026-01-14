import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_sizes.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:devotional/src/features/home/components/footer_links.dart';
import 'package:devotional/src/features/home/components/social_icon.dart';
import 'package:flutter/material.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isDesktop = screenWidth > AppSizes.tabletBreakpoint;

        return Container(
          color: AppColors.softBeige,
          padding: EdgeInsets.only(
            top: isDesktop ? 96 : 64,
            bottom: 48,
            left: isDesktop ? 40 : 16,
            right: isDesktop ? 40 : 16,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSizes.maxContentWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isDesktop)
                    _buildDesktopTop(context)
                  else
                    _buildMobileTop(context),
                  const SizedBox(height: 64),
                  Container(height: 1, color: AppColors.stone200),
                  const SizedBox(height: 32),
                  _buildBottom(context, isDesktop),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktopTop(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Brand & Bio
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lilly Bosek',
                style: AppStyles.serifDisplay.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.warmTaupe,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Bringing hope, healing, and encouragement through digital ministry, music, and the power of storytelling.',
                style: AppStyles.sansDisplay.copyWith(
                  color: AppColors.stone500,
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 32),
              const Row(
                children: [
                  SocialIcon(icon: Icons.share),
                  SizedBox(width: 16),
                  SocialIcon(icon: Icons.music_note),
                  SizedBox(width: 16),
                  SocialIcon(icon: Icons.video_library),
                ],
              ),
            ],
          ),
        ),
        const Spacer(flex: 1),
        // Links
        const Expanded(
          flex: 2,
          child: FooterLinks(
            title: 'QUICK LINKS',
            links: [
              'Weekly Worship',
              'Bible Studies',
              'Encouragement Series',
              'Music Playlist',
            ],
          ),
        ),
        const Expanded(
          flex: 2,
          child: FooterLinks(
            title: 'PARTNER',
            links: ['Support Ministry', 'Contact Lilly', 'Invite to Lead'],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileTop(BuildContext context) {
    return Column(
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
        const SizedBox(height: 16),
        Text(
          'Bringing hope, healing, and encouragement through digital ministry, music, and the power of storytelling.',
          style: AppStyles.sansDisplay.copyWith(
            color: AppColors.stone500,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),
        const Row(
          children: [
            SocialIcon(icon: Icons.share),
            SizedBox(width: 16),
            SocialIcon(icon: Icons.music_note),
            SizedBox(width: 16),
            SocialIcon(icon: Icons.video_library),
          ],
        ),
        const SizedBox(height: 48),
        const FooterLinks(
          title: 'QUICK LINKS',
          links: [
            'Weekly Worship',
            'Bible Studies',
            'Encouragement Series',
            'Music Playlist',
          ],
        ),
        const SizedBox(height: 48),
        const FooterLinks(
          title: 'PARTNER',
          links: ['Support Ministry', 'Contact Lilly', 'Invite to Lead'],
        ),
      ],
    );
  }

  Widget _buildBottom(BuildContext context, bool isDesktop) {
    final legalLinks = [
      Text(
        'Privacy Policy',
        style: AppStyles.sansDisplay.copyWith(
          fontSize: 12,
          color: AppColors.stone400,
        ),
      ),
      const SizedBox(width: 24),
      Text(
        'Terms of Service',
        style: AppStyles.sansDisplay.copyWith(
          fontSize: 12,
          color: AppColors.stone400,
        ),
      ),
    ];

    if (isDesktop) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '© 2026 Lilly Bosek. All rights reserved.',
            style: AppStyles.sansDisplay.copyWith(
              fontSize: 12,
              color: AppColors.stone400,
            ),
          ),
          Row(children: legalLinks),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '© 2026 Lilly Bosek. All rights reserved.',
          style: AppStyles.sansDisplay.copyWith(
            fontSize: 12,
            color: AppColors.stone400,
          ),
        ),
        const SizedBox(height: 16),
        Row(children: legalLinks),
      ],
    );
  }
}
