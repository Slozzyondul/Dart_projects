import 'package:devotional/src/common_widgets/app_drawer.dart';
import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/features/daily_quotes/components/decorative_divider.dart';
import 'package:devotional/src/features/daily_quotes/components/journal_section.dart';
import 'package:devotional/src/features/daily_quotes/components/prayer_section.dart';
import 'package:devotional/src/features/daily_quotes/components/quotes_header.dart';
import 'package:devotional/src/features/daily_quotes/components/reflection_prompt_card.dart';
import 'package:devotional/src/features/daily_quotes/components/scripture_box.dart';
import 'package:devotional/src/features/daily_quotes/components/share_devotional_button.dart';
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
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuotesHeader(),
        SizedBox(height: 40),
        ScriptureBox(),
        SizedBox(height: 48),
        PrayerSection(),
        SizedBox(height: 40),
        DecorativeDivider(),
      ],
    );
  }

  Widget _buildSidebar() {
    return const Column(
      children: [
        ReflectionPromptCard(),
        SizedBox(height: 32),
        JournalSection(),
        SizedBox(height: 32),
        ShareDevotionalButton(),
      ],
    );
  }
}
