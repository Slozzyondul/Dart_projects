import 'package:devotional/src/common_widgets/app_drawer.dart';
import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_sizes.dart';
import 'package:devotional/src/features/contact/components/contact_form_section.dart';
import 'package:devotional/src/features/contact/components/contact_hero_section.dart';
import 'package:devotional/src/features/contact/components/contact_sidebar_section.dart';
import 'package:devotional/src/features/home/presentation/home_footer.dart';
import 'package:devotional/src/features/home/presentation/home_header.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
                    const ContactHeroSection(),
                    _buildResponsiveContent(),
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

  Widget _buildResponsiveContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppSizes.desktopBreakpoint;
        final horizontalPadding = isDesktop
            ? (constraints.maxWidth - AppSizes.maxContentWidth) / 2 + 64
            : 24.0;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding > 24 ? horizontalPadding : 24,
            vertical: isDesktop ? 120 : 80,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSizes.maxContentWidth,
              ),
              child: isDesktop ? _buildDesktopContent() : _buildMobileContent(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktopContent() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 6, child: ContactFormSection()),
        SizedBox(width: 120),
        Expanded(flex: 4, child: ContactSidebarSection()),
      ],
    );
  }

  Widget _buildMobileContent() {
    return const Column(
      children: [
        ContactFormSection(),
        SizedBox(height: 80),
        ContactSidebarSection(),
      ],
    );
  }
}
