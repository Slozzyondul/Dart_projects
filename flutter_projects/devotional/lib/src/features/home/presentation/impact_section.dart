import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_sizes.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:devotional/src/features/home/components/stat_item.dart';
import 'package:devotional/src/features/home/components/testimonial_card.dart';
import 'package:flutter/material.dart';

class ImpactSection extends StatelessWidget {
  const ImpactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > AppSizes.tabletBreakpoint;

        return Container(
          color: AppColors.charcoalGrey,
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 40 : 16,
            vertical: 96,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSizes.maxContentWidth,
              ),
              child: Column(
                children: [
                  if (isDesktop)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: StatItem(
                            number: '1000+',
                            label: 'People Reached',
                          ),
                        ),
                        const Expanded(
                          child: StatItem(
                            number: '800+',
                            label: 'Videos Shared',
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  5,
                                  (index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
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
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        const StatItem(
                          number: '1000+',
                          label: 'People Reached',
                        ),
                        const SizedBox(height: 48),
                        const StatItem(number: '800+', label: 'Videos Shared'),
                        const SizedBox(height: 48),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                5,
                                (index) =>
                                    const Icon(Icons.star, color: Colors.amber),
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
                      ],
                    ),
                  const SizedBox(height: 80),
                  Container(height: 1, color: AppColors.stone700),
                  const SizedBox(height: 80),
                  Text(
                    'Heartfelt Testimonials',
                    style: AppStyles.serifDisplay.copyWith(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 64),
                  if (isDesktop)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: TestimonialCard(
                            quote:
                                '"These weekly worship sessions are truly my anchor. Through a very difficult season, Lilly\'s music reminded me that God is always near. Baraka tele!"',
                            name: 'Wanjiku Mwangi',
                            role: 'Community Member, Nairobi',
                          ),
                        ),
                        const SizedBox(width: 32),
                        const Expanded(
                          child: TestimonialCard(
                            quote:
                                '"The Bible study series is so accessible. As a busy entrepreneur in CBD, I finally found a way to stay grounded in the Word. Highly recommended."',
                            name: 'David Otieno',
                            role: 'Entrepreneur',
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
