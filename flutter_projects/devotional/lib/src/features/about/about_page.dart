import 'package:devotional/src/common_widgets/app_drawer.dart';
import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:devotional/src/features/about/components/expertise_card.dart';
import 'package:devotional/src/features/home/presentation/home_footer.dart';
import 'package:devotional/src/features/home/presentation/home_header.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
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
                    _buildHeroSection(),
                    _buildMissionSection(),
                    _buildExpertiseSection(),
                    _buildCommunitySection(),
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

  Widget _buildHeroSection() {
    return Container(
      color: AppColors.softBeige,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Stack(
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
            ),
          ),
          const SizedBox(height: 48),
          Column(
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
                    fontSize: 40,
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
                        fontSize: 40,
                      ),
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Healing',
                      style: AppStyles.serifDisplay.copyWith(
                        color: AppColors.warmTaupe,
                        fontStyle: FontStyle.normal,
                        fontSize: 40,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 20,
                  ),
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
          ),
        ],
      ),
    );
  }

  Widget _buildMissionSection() {
    return Container(
      color: AppColors.stone200, // beige-medium
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
      width: double.infinity,
      child: Column(
        children: [
          const Icon(Icons.auto_awesome, color: AppColors.warmTaupe, size: 40),
          const SizedBox(height: 24),
          Text(
            'Personal Mission',
            style: AppStyles.serifDisplay.copyWith(
              fontSize: 24,
              fontStyle: FontStyle.italic,
              color: AppColors.charcoalGrey,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '"Bringing hope and healing through Christ to every screen and every soul."',
            textAlign: TextAlign.center,
            style: AppStyles.sansDisplay.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w300,
              color: AppColors.charcoalGrey,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 40),
          Container(width: 64, height: 1, color: AppColors.warmTaupe),
        ],
      ),
    );
  }

  Widget _buildExpertiseSection() {
    return Container(
      color: AppColors.softBeige,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 96),
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
          Text(
            'Through years of ministry and digital exploration, Lilly has cultivated a diverse set of skills aimed at magnifying the message of the Gospel in a digital age.',
            style: AppStyles.sansDisplay.copyWith(
              fontSize: 16,
              color: AppColors.charcoalGrey.withValues(alpha: 0.7),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 48),
          const Column(
            children: [
              ExpertiseCard(
                icon: Icons.record_voice_over,
                title: 'Vocal Leadership',
                description:
                    'Leading congregations and audiences into deep spaces of worship and spiritual connection.',
              ),
              SizedBox(height: 24),
              ExpertiseCard(
                icon: Icons.volunteer_activism,
                title: 'Audience Encouragement',
                description:
                    'Crafting messages and moments that speak directly to the heart of the weary.',
              ),
              SizedBox(height: 24),
              ExpertiseCard(
                icon: Icons.equalizer,
                title: 'Music Production Basics',
                description:
                    'Technical proficiency in creating high-quality worship content and digital soundscapes.',
              ),
              SizedBox(height: 24),
              ExpertiseCard(
                icon: Icons.mic,
                title: 'Public Speaking',
                description:
                    'Communicating biblical truths with clarity, warmth, and authentic storytelling.',
              ),
              SizedBox(height: 24),
              ExpertiseCard(
                icon: Icons.hub,
                title: 'Social Media Management',
                description:
                    'Strategizing digital presence to maximize reach and impact for ministry.',
              ),
              SizedBox(height: 24),
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
    );
  }

  Widget _buildCommunitySection() {
    return Container(
      color: AppColors.stone200,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 96),
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: AppColors.charcoalGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(
              'STAY CONNECTED',
              style: AppStyles.sansDisplay.copyWith(
                color: AppColors.warmTaupe,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Join our community of hope.',
              textAlign: TextAlign.center,
              style: AppStyles.serifDisplay.copyWith(
                fontSize: 32,
                fontStyle: FontStyle.italic,
                color: AppColors.softBeige,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Receive monthly letters of encouragement, digital ministry tips, and exclusive worship sessions from Lilly.',
              textAlign: TextAlign.center,
              style: AppStyles.sansDisplay.copyWith(
                color: AppColors.softBeige.withValues(alpha: 0.7),
                height: 1.6,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                hintText: 'Your email address',
                hintStyle: TextStyle(
                  color: AppColors.softBeige.withValues(alpha: 0.4),
                ),
                filled: true,
                fillColor: Colors.white.withValues(alpha: 0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: AppColors.warmTaupe),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.warmTaupe,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(
                  'SUBSCRIBE',
                  style: AppStyles.sansDisplay.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
