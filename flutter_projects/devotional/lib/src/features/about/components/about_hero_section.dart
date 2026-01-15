import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:devotional/src/common_widgets/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AboutHeroSection extends StatelessWidget {
  const AboutHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppSizes.desktopBreakpoint;
        final horizontalPadding = isDesktop
            ? (constraints.maxWidth - AppSizes.maxContentWidth) / 2 + 64
            : 24.0;

        return Container(
          color: AppColors.softBeige,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding > 24 ? horizontalPadding : 24,
            vertical: isDesktop ? 120 : 64,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSizes.maxContentWidth,
              ),
              child: isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 5, child: _buildImageCard()),
        const SizedBox(width: 80),
        Expanded(flex: 6, child: _buildTextContent(isDesktop: true)),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildImageCard(),
        const SizedBox(height: 48),
        _buildTextContent(isDesktop: false),
      ],
    );
  }

  Widget _buildImageCard() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -16,
          left: -16,
          right: 16,
          bottom: 16,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.warmTaupe.withValues(alpha: 0.3),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 4 / 5,
            child: Image.asset(
              'assets/images/Add_a_heading.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextContent({required bool isDesktop}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'MEET LILLY BOSEK',
          style: AppStyles.sansDisplay.copyWith(
            color: AppColors.warmTaupe,
            fontWeight: FontWeight.bold,
            fontSize: 12,
            letterSpacing: 2.0,
          ),
        ),
        const SizedBox(height: 16),
        RichText(
          text: TextSpan(
            style: AppStyles.serifDisplay.copyWith(
              fontSize: isDesktop ? 48 : 40,
              height: 1.1,
              color: AppColors.charcoalGrey,
              fontStyle: FontStyle.italic,
            ),
            children: [
              const TextSpan(text: 'A voice for '),
              TextSpan(
                text: 'Hope',
                style: AppStyles.serifDisplay.copyWith(
                  color: AppColors.warmTaupe,
                  fontStyle: FontStyle.normal,
                  fontSize: isDesktop ? 48 : 40,
                ),
              ),
              const TextSpan(text: ' and '),
              TextSpan(
                text: 'Healing',
                style: AppStyles.serifDisplay.copyWith(
                  color: AppColors.warmTaupe,
                  fontStyle: FontStyle.normal,
                  fontSize: isDesktop ? 48 : 40,
                ),
              ),
              const TextSpan(text: '.'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Lilly is a Christian content creator, worship leader, digital ministry entrepreneur, and community builder. Her journey is defined by a deep-seated passion for storytelling that bridges the gap between faith and modern digital connection.',
          style: AppStyles.sansDisplay.copyWith(
            fontSize: 18,
            color: AppColors.charcoalGrey.withValues(alpha: 0.8),
            height: 1.6,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.warmTaupe,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text(
            'WATCH MY STORY',
            style: AppStyles.sansDisplay.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
