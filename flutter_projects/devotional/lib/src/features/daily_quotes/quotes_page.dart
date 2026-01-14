import 'package:devotional/src/common_widgets/app_drawer.dart';
import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:devotional/src/features/home/presentation/home_footer.dart';
import 'package:devotional/src/features/home/presentation/home_header.dart';
import 'package:flutter/material.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  @override
  Widget build(BuildContext context) {
    // bg-background-light #f7f3ed is very close to AppColors.softBeige (#F5F2ED).
    return SelectionArea(
      child: Scaffold(
        backgroundColor: AppColors.softBeige,
        endDrawer: const AppDrawer(),
        body: Column(
          children: [
            const HomeHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 48,
                      ),
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            // Responsive switch
                            if (constraints.maxWidth < 900) {
                              return Column(
                                children: [
                                  _buildMainContent(),
                                  const SizedBox(height: 64),
                                  _buildSidebar(),
                                ],
                              );
                            } else {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(flex: 2, child: _buildMainContent()),
                                  const SizedBox(width: 64),
                                  Expanded(flex: 1, child: _buildSidebar()),
                                ],
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    const HomeFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Page Heading
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DAILY DEVOTIONAL',
              style: AppStyles.sansDisplay.copyWith(
                color: AppColors.quotesPrimary.withValues(alpha: 0.6),
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Monday, October 23rd',
              style: AppStyles.serifDisplay.copyWith(
                color: AppColors.charcoalGrey,
                fontSize: 48,
                fontWeight: FontWeight.w900,
                height: 1.1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        // Key Scripture Box
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.skyBlue,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.skyBlue.withValues(alpha: 0.3),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          padding: const EdgeInsets.all(48),
          child: Column(
            children: [
              const Icon(
                Icons.format_quote,
                size: 48,
                color: Color(0x4D333333), // charcoal/30
              ),
              const SizedBox(height: 24),
              Text(
                '"The Lord is my shepherd; I shall not want. He makes me lie down in green pastures. He leads me beside still waters. He restores my soul."',
                textAlign: TextAlign.center,
                style: AppStyles.serifDisplay.copyWith(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  height: 1.6,
                  color: AppColors.charcoalGrey,
                ),
              ),
              const SizedBox(height: 32),
              Container(width: 48, height: 1.0, color: Colors.black12),
              const SizedBox(height: 8),
              Text(
                'PSALM 23:1-3',
                style: AppStyles.sansDisplay.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: AppColors.charcoalGrey.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 48),
        // Today's Prayer
        Row(
          children: [
            Text(
              "Today's Prayer",
              style: AppStyles.serifDisplay.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.quotesPrimary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                height: 1,
                color: AppColors.quotesPrimary.withValues(alpha: 0.1),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPrayerParagraph(
              'Dear Heavenly Father, we come before You today with hearts open to Your guidance. Just as a shepherd leads his flock with patience and unyielding care, lead us beside still waters today. In the midst of the noise and the demands of our schedules, remind us that our identity is found in being Yours, not in our doing.',
            ),
            _buildPrayerParagraph(
              'Lord, restore our souls where they have become frayed or weary. We lay down our anxieties at Your feet, trusting that You provide exactly what we need for this day. May Your goodness and mercy follow us through every conversation, every task, and every moment of rest.',
            ),
            _buildPrayerParagraph(
              "Help us to hear Your voice above the world's clamor. Give us the courage to follow where You lead, knowing that Your paths are those of righteousness and peace. We rest in the assurance that we lack nothing when we are with You.",
            ),
            const SizedBox(height: 16),
            Text(
              'Amen.',
              style: AppStyles.sansDisplay.copyWith(
                fontSize: 18,
                color: AppColors.quotesPrimary,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        // Decorative Divider
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDot(0.2),
            const SizedBox(width: 8),
            _buildDot(0.4),
            const SizedBox(width: 8),
            _buildDot(0.2),
          ],
        ),
      ],
    );
  }

  Widget _buildSidebar() {
    return Column(
      children: [
        // Image Component
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 4 / 5,
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuA9sxoty3smYV33wab4J6wwj8iCtDs4zT8bk8gapxcWXg4DmDRGG3vUCm7MguUAbnQNBoGInPjqOxkjC_cNhXzB7ksy1xEkS_bFI9JLeLB5eVa2qVy6Pt_DttmBDf1G8jwsP9DuAzq7EmPa3ceSbxbsdi8Ogx-aFkR9WHO4VEp_A-LIeXjBtw81dgZE2eJr5C-hdyrzymUg-K7haJWl7xRpTDr9Eoe672zJeGIYxplCnWExh_khpyEVRyBqzaexJXjqkq6sqyayLRs',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  color: AppColors.quotesPrimary.withValues(
                    alpha: 0.1,
                  ), // mix-blend-multiply sim
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'REFLECTION PROMPT',
                        style: AppStyles.sansDisplay.copyWith(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '"Where is God leading you to rest today?"',
                        style: AppStyles.serifDisplay.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        // Journal Your Thoughts
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.quotesPrimary.withValues(alpha: 0.05),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.edit_note, color: AppColors.quotesPrimary),
                  const SizedBox(width: 12),
                  Text(
                    'My Reflections',
                    style: AppStyles.serifDisplay.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.quotesPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: "Write what's on your heart today...",
                  hintStyle: TextStyle(
                    color: AppColors.quotesPrimary.withValues(alpha: 0.3),
                  ),
                  border: InputBorder.none,
                ),
                style: const TextStyle(color: AppColors.charcoalGrey),
              ),
              const SizedBox(height: 16),
              Container(
                height: 1,
                color: AppColors.quotesPrimary.withValues(alpha: 0.1),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'AUTO-SAVED TO YOUR JOURNAL',
                    style: AppStyles.sansDisplay.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: AppColors.quotesPrimary.withValues(alpha: 0.4),
                    ),
                  ),
                  const Icon(
                    Icons.history,
                    color: AppColors.quotesPrimary,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        // Share Button
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.quotesPrimary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.share, size: 20),
              const SizedBox(width: 12),
              Text(
                'Share Devotional',
                style: AppStyles.sansDisplay.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'SPREAD THE WORD • ENCOURAGE A FRIEND',
          style: AppStyles.sansDisplay.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            letterSpacing: 2.0,
            color: AppColors.quotesPrimary.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }

  Widget _buildPrayerParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Text(
        text,
        style: AppStyles.serifDisplay.copyWith(
          fontSize: 18,
          height: 1.8,
          color: AppColors.charcoalGrey.withValues(alpha: 0.8),
        ),
      ),
    );
  }

  Widget _buildDot(double alpha) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.quotesPrimary.withValues(alpha: alpha),
      ),
    );
  }
}
