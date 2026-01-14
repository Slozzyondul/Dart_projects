import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/app_drawer.dart';
import 'package:devotional/src/features/home/presentation/hero_section.dart';
import 'package:devotional/src/features/home/presentation/home_footer.dart';
import 'package:devotional/src/features/home/presentation/home_header.dart';
import 'package:devotional/src/features/home/presentation/impact_section.dart';
import 'package:devotional/src/features/home/presentation/motivational_quotes_section.dart';
import 'package:devotional/src/features/home/presentation/newsletter_section.dart';
import 'package:devotional/src/features/home/presentation/projects_section.dart';
import 'package:devotional/src/features/home/presentation/quote_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  children: const [
                    HeroSection(),
                    QuoteSection(),
                    ProjectsSection(),
                    MotivationalQuotesSection(),
                    ImpactSection(),
                    NewsletterSection(),
                    HomeFooter(),
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
