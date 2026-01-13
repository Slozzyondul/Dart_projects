import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:devotional/src/features/home/components/project_card.dart';
import 'package:devotional/src/features/home/components/small_project_card.dart';
import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      child: Column(
        children: [
          Text(
            'Ministry Projects',
            style: AppStyles.serifDisplay.copyWith(
              fontSize: 32,
              color: AppColors.charcoalGrey,
            ),
          ),
          const SizedBox(height: 16),
          Container(width: 80, height: 4, color: AppColors.warmTaupe),
          const SizedBox(height: 48),
          const ProjectCard(
            title: 'Weekly Worship Sessions',
            description:
                'A digital sanctuary for corporate praise and intimate worship moments.',
            imageUrl:
                'https://lh3.googleusercontent.com/aida-public/AB6AXuD_sFXtRhGCDoKrFXUcfeIfY3WtOrNGYD275aqOEuTWirMtWULaXGT6c8TM_4Ch8kbRy-jgJ2k31BkD--Ufwj4oDNyyRjWi1z3LprRl8YLHJdgzlu_uenSX0L2hc0QKCKRfQlQMKnELMVNRvzJFKrXQ_BrHFKSOpprdR8gfOgoni2qqhQOGX1KAQFyMNdcO-AfkBb9rqLdPF7rGjs4hgooDSF-OcJvb52iqQDRaof3HydIJN5jCPX1KCoGUxIsC9wT7RCHDeY2qKpM',
            actionText: 'Explore',
          ),
          const SizedBox(height: 32),
          const ProjectCard(
            title: 'Bible Study Videos',
            description:
                'Deep dives into Scripture to find daily relevance and spiritual growth.',
            imageUrl:
                'https://lh3.googleusercontent.com/aida-public/AB6AXuCFyEmRiTvc3_tp4ibPsiwOAWvljKbA5rqeMqzrxr8l_-gFPJhSxVfjMnR106w3M5ovHm_rFbt5nks3Z3_y2JQDOTjkcgS_TIWSyNJTekBf-sByLq-vP8UlnUjcmfJ4wxmE30bp4IUUTwPcAHDQ3lhi0vd1S9TqElHZpM7U--lthJ4Y6PiPMbiO4U1kr2WuOl4imacuvWuL9EA8UP8YXp30U_4h8cmioj6svLmRBIhF2NcjkA03KrzoKjZYwTfI_ZCZX3XpyYBYZFM',
            actionText: 'Watch',
          ),
          const SizedBox(height: 32),
          const ProjectCard(
            title: 'Christmas Playlist Project',
            description:
                'A seasonal collection of hymns and carols to celebrate the Savior.',
            imageUrl:
                'https://lh3.googleusercontent.com/aida-public/AB6AXuAFkPhL6Q6Vggwds8Z-gfIm4olbQIzsMEh6dAikQ_G9QtNCgQSJSeV_OZTzvC5t_E23tNPdntIbP-J7H5OEc8We9VoXeHtNBQEysC_vRxeKKvOyhVm7NKgDqe_Rn7vGVM58rFS_gK9WiavgDIvYOx3wm-sKEnv06ofD3MTOtrrRiL6i2aNthzAV6D4P2l-8VJ2YkWvL0MNO0r3GVYxGy2Ra1uwr9bYJfgwW5ajGSfadJ1Ymw54qrMHjx0Ano6gfsp43M4_ARByKrGc',
            actionText: 'Listen',
          ),
          const SizedBox(height: 48),
          const SmallProjectCard(
            icon: Icons.camera_alt,
            title: 'Instagram Quotes',
            subtitle: 'Daily visual inspirations.',
          ),
          const SizedBox(height: 16),
          const SmallProjectCard(
            icon: Icons.groups,
            title: 'Tri-Prayer Sessions',
            subtitle: 'Community prayer three times weekly.',
          ),
          const SizedBox(height: 16),
          const SmallProjectCard(
            icon: Icons.auto_awesome,
            title: 'Encouragement Series',
            subtitle: 'Short stories for difficult seasons.',
          ),
          const SizedBox(height: 48),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.stone300,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.queue_music, color: AppColors.stone400),
                const SizedBox(width: 16),
                Text(
                  'Collaborations and more projects arriving soon',
                  style: AppStyles.sansDisplay.copyWith(
                    color: AppColors.stone500,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
