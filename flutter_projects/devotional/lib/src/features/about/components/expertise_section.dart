import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:devotional/src/common_widgets/constants/app_sizes.dart';
import 'package:devotional/src/features/about/components/expertise_card.dart';
import 'package:flutter/material.dart';

class ExpertiseSection extends StatelessWidget {
  const ExpertiseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppSizes.desktopBreakpoint;
        final isTablet =
            constraints.maxWidth >= AppSizes.tabletBreakpoint &&
            constraints.maxWidth < AppSizes.desktopBreakpoint;

        final horizontalPadding = isDesktop
            ? (constraints.maxWidth - AppSizes.maxContentWidth) / 2 + 64
            : 24.0;

        int crossAxisCount = 1;
        if (isDesktop) {
          crossAxisCount = 3;
        } else if (isTablet) {
          crossAxisCount = 2;
        }

        return Container(
          color: AppColors.softBeige,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding > 24 ? horizontalPadding : 24,
            vertical: isDesktop ? 120 : 80,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSizes.maxContentWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gifts & Expertise',
                    style: AppStyles.serifDisplay.copyWith(
                      fontSize: 32,
                      color: AppColors.charcoalGrey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Text(
                      'Through years of ministry and digital exploration, Lilly has cultivated a diverse set of skills aimed at magnifying the message of the Gospel in a digital age.',
                      style: AppStyles.sansDisplay.copyWith(
                        fontSize: 16,
                        color: AppColors.charcoalGrey.withValues(alpha: 0.7),
                        height: 1.6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                    childAspectRatio: 1.2, // Adjust based on content
                    children: const [
                      ExpertiseCard(
                        icon: Icons.record_voice_over,
                        title: 'Vocal Leadership',
                        description:
                            'Leading congregations and audiences into deep spaces of worship and spiritual connection.',
                      ),
                      ExpertiseCard(
                        icon: Icons.volunteer_activism,
                        title: 'Audience Encouragement',
                        description:
                            'Crafting messages and moments that speak directly to the heart of the weary.',
                      ),
                      ExpertiseCard(
                        icon: Icons.equalizer,
                        title: 'Music Production Basics',
                        description:
                            'Technical proficiency in creating high-quality worship content and digital soundscapes.',
                      ),
                      ExpertiseCard(
                        icon: Icons.mic,
                        title: 'Public Speaking',
                        description:
                            'Communicating biblical truths with clarity, warmth, and authentic storytelling.',
                      ),
                      ExpertiseCard(
                        icon: Icons.hub,
                        title: 'Social Media Management',
                        description:
                            'Strategizing digital presence to maximize reach and impact for ministry.',
                      ),
                      ExpertiseCard(
                        icon: Icons.groups,
                        title: 'Community Building',
                        description:
                            'Fostering safe, engaged, and Christ-centered online communities.',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
