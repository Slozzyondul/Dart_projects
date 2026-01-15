import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

class ContactSidebarSection extends StatelessWidget {
  const ContactSidebarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSidebarResource(
          'Event Resources',
          'Access our official media kit for event organizers, including professional biographies, high-resolution photography, and technical riders.',
          'DOWNLOAD PRESS KIT',
        ),
        const SizedBox(height: 48),
        _buildSidebarResource(
          'Digital Fellowship',
          'Join the community online for daily encouragement and behind-the-scenes moments.',
          null,
          child: Row(
            children: [
              _buildSocialIcon(Icons.camera_alt), // Instagram placeholder
              const SizedBox(width: 24),
              _buildSocialIcon(Icons.video_library), // YouTube placeholder
            ],
          ),
        ),
        const SizedBox(height: 48),
        Container(
          padding: const EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: AppColors.charcoalGrey.withValues(alpha: 0.1),
              ),
            ),
          ),
          child: Column(
            children: [
              Text(
                '"A genuine encounter with hope that our community desperately needed. Lilly brings more than music; she brings a presence that transforms the room."',
                style: AppStyles.serifDisplay.copyWith(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  height: 1.6,
                  color: AppColors.charcoalGrey,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.stone200,
                      borderRadius: BorderRadius.circular(4),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/Black Modern Minimalist Reminder Instagram Post.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SARAH JENKINS',
                        style: AppStyles.sansDisplay.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: AppColors.charcoalGrey,
                        ),
                      ),
                      Text(
                        'YOUTH DIRECTOR',
                        style: AppStyles.sansDisplay.copyWith(
                          fontSize: 10,
                          letterSpacing: 1.5,
                          color: AppColors.charcoalGrey.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSidebarResource(
    String title,
    String description,
    String? linkText, {
    Widget? child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.stone200.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.serifDisplay.copyWith(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: AppColors.charcoalGrey,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: AppStyles.sansDisplay.copyWith(
              fontSize: 14,
              color: AppColors.charcoalGrey.withValues(alpha: 0.8),
              height: 1.6,
              fontWeight: FontWeight.w300,
            ),
          ),
          if (linkText != null) ...[
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  linkText,
                  style: AppStyles.sansDisplay.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: AppColors.charcoalGrey,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: AppColors.charcoalGrey,
                ),
              ],
            ),
          ],
          if (child != null) ...[const SizedBox(height: 24), child],
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Icon(icon, color: AppColors.charcoalGrey, size: 24);
  }
}
