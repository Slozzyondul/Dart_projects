import 'package:devotional/src/common_widgets/app_drawer.dart';
import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/features/about/components/about_hero_section.dart';
import 'package:devotional/src/features/about/components/about_newsletter_section.dart';
import 'package:devotional/src/features/about/components/expertise_section.dart';
import 'package:devotional/src/features/about/components/mission_section.dart';
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
                    const AboutHeroSection(),
                    const MissionSection(),
                    const ExpertiseSection(),
                    const AboutNewsletterSection(),
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
}
