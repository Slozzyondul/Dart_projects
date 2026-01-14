import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_sizes.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:devotional/src/features/home/components/project_card.dart';
import 'package:devotional/src/features/home/components/small_project_card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:devotional/src/features/home/components/worship_calendar_dialog.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isDesktop = screenWidth > AppSizes.tabletBreakpoint;
        final isLargeDesktop = screenWidth > AppSizes.desktopBreakpoint;

        return Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 40 : 16,
            vertical: 80,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSizes.maxContentWidth,
              ),
              child: Column(
                children: [
                  Text(
                    'Ministry Projects',
                    style: AppStyles.serifDisplay.copyWith(
                      fontSize: isDesktop ? 40 : 32,
                      color: AppColors.charcoalGrey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(width: 80, height: 4, color: AppColors.warmTaupe),
                  const SizedBox(height: 64),

                  // Main Projects Grid
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isDesktop ? 3 : 1,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                    childAspectRatio: isDesktop ? 0.75 : 1.1,
                    children: [
                      ProjectCard(
                        title: 'Weekly Worship Sessions',
                        description:
                            'A digital sanctuary for corporate praise and intimate worship moments.',
                        imageUrl: 'assets/images/Daily_PRAYER.png',
                        actionText: 'Explore',
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => const WorshipCalendarDialog(),
                          );
                        },
                      ),
                      ProjectCard(
                        title: 'Bible Study Videos',
                        description:
                            'Deep dives into Scripture to find daily relevance and spiritual growth.',
                        imageUrl: 'assets/images/Prayer_For.png',
                        actionText: 'Watch',
                        onTap: () async {
                          final Uri url = Uri.parse(
                            'https://www.youtube.com/watch?v=bMKWkskEvm4&list=PL8fAnEOS5d_pqWYGXyXFNTfTM6eLD0YPh&index=1',
                          );
                          if (!await launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          )) {
                            debugPrint('Could not launch \$url');
                          }
                        },
                      ),
                      const ProjectCard(
                        title: 'Christmas Playlist Project',
                        description:
                            'A seasonal collection of hymns and carols to celebrate the Savior.',
                        imageUrl: 'assets/images/If_God.png',
                        actionText: 'Listen',
                      ),
                    ],
                  ),

                  const SizedBox(height: 64),

                  // Small Projects Grid
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isLargeDesktop
                        ? 3
                        : (screenWidth > AppSizes.mobileBreakpoint ? 2 : 1),
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 16,
                    childAspectRatio: 3.5,
                    children: const [
                      SmallProjectCard(
                        icon: Icons.camera_alt,
                        title: 'Instagram Quotes',
                        subtitle: 'Daily visual inspirations.',
                      ),
                      SmallProjectCard(
                        icon: Icons.groups,
                        title: 'Tri-Prayer Sessions',
                        subtitle: 'Community prayer three times weekly.',
                      ),
                      SmallProjectCard(
                        icon: Icons.auto_awesome,
                        title: 'Encouragement Series',
                        subtitle: 'Short stories for difficult seasons.',
                      ),
                    ],
                  ),

                  const SizedBox(height: 64),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.stone300,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.queue_music,
                          color: AppColors.stone400,
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          child: Text(
                            'Collaborations and more projects arriving soon',
                            style: AppStyles.sansDisplay.copyWith(
                              color: AppColors.stone500,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
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
