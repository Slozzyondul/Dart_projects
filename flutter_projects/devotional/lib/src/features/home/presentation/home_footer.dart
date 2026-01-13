import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:devotional/src/features/home/components/footer_links.dart';
import 'package:devotional/src/features/home/components/social_icon.dart';
import 'package:flutter/material.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.softBeige,
      padding: const EdgeInsets.only(top: 64, bottom: 48, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lilly Boskek',
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
          const SizedBox(height: 64),
          Container(height: 1, color: AppColors.stone200),
          const SizedBox(height: 32),
          Text(
            '© 2024 Lilly Boskek. All rights reserved.',
            style: AppStyles.sansDisplay.copyWith(
              fontSize: 12,
              color: AppColors.stone400,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
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
            ],
          ),
        ],
      ),
    );
  }
}
