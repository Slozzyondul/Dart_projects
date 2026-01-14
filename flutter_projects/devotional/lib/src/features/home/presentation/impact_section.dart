import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:devotional/src/features/home/components/stat_item.dart';
import 'package:devotional/src/features/home/components/testimonial_card.dart';
import 'package:flutter/material.dart';

class ImpactSection extends StatelessWidget {
  const ImpactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.charcoalGrey,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 96),
      child: Column(
        children: [
          const StatItem(number: '1000+', label: 'People Reached'),
          const SizedBox(height: 48),
          const StatItem(number: '800+', label: 'Videos Shared'),
          const SizedBox(height: 48),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => const Icon(Icons.star, color: Colors.amber),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '"Lilly\'s music has been a beacon of hope for me."',
                textAlign: TextAlign.center,
                style: AppStyles.sansDisplay.copyWith(
                  color: AppColors.stone300,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 80),
          Container(height: 1, color: AppColors.stone700),
          const SizedBox(height: 80),
          Text(
            'Heartfelt Testimonials',
            style: AppStyles.serifDisplay.copyWith(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 48),
          const TestimonialCard(
            quote:
                '"These weekly worship sessions are truly my anchor. Through a very difficult season, Lilly\'s music reminded me that God is always near. Baraka tele!"',
            name: 'Wanjiku Mwangi',
            role: 'Community Member, Nairobi',
          ),
          const SizedBox(height: 32),
          const TestimonialCard(
            quote:
                '"The Bible study series is so accessible. As a busy entrepreneur in CBD, I finally found a way to stay grounded in the Word. Highly recommended."',
            name: 'David Otieno',
            role: 'Entrepreneur',
          ),
        ],
      ),
    );
  }
}
