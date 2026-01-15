import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:devotional/src/common_widgets/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class ContactHeroSection extends StatelessWidget {
  const ContactHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppSizes.desktopBreakpoint;
        final horizontalPadding = isDesktop
            ? (constraints.maxWidth - AppSizes.maxContentWidth) / 2 + 64
            : 24.0;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding > 24 ? horizontalPadding : 24,
            vertical: isDesktop ? 120 : 64,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.charcoalGrey.withValues(alpha: 0.1),
              ),
            ),
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
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: AspectRatio(
        aspectRatio: 5 / 6,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.stone200,
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              image: AssetImage('assets/images/Neutral_Beige.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent({required bool isDesktop}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'GET IN TOUCH',
          style: AppStyles.sansDisplay.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 3.0,
            color: AppColors.charcoalGrey.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Partner in Hope & Healing',
          style: AppStyles.serifDisplay.copyWith(
            fontSize: isDesktop ? 56 : 48,
            height: 1.1,
            fontStyle: FontStyle.italic,
            color: AppColors.charcoalGrey,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Lilly Bosek is dedicated to bringing encouragement through worship ministry and storytelling. For booking inquiries, workshops, or general messages of hope, please reach out below.',
          style: AppStyles.sansDisplay.copyWith(
            fontSize: 18,
            height: 1.6,
            fontWeight: FontWeight.w300,
            color: AppColors.charcoalGrey.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.only(top: 32),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: AppColors.charcoalGrey.withValues(alpha: 0.1),
              ),
            ),
          ),
          child: Column(
            children: [
              _buildContactItem(
                Icons.mail_outline,
                'bosekfavour@gmail.com',
                'mailto:bosekfavour@gmail.com',
              ),
              const SizedBox(height: 16),
              _buildContactItem(
                Icons.call_outlined,
                '+254 770 417 3734',
                'tel:+2547704173734',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String text, String url) {
    return Row(
      children: [
        Icon(icon, color: AppColors.charcoalGrey.withValues(alpha: 0.7)),
        const SizedBox(width: 16),
        Text(
          text,
          style: AppStyles.sansDisplay.copyWith(
            fontSize: 16,
            color: AppColors.charcoalGrey,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
