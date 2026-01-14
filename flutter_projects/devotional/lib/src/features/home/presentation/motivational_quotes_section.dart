import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_sizes.dart';
import 'package:devotional/src/features/home/components/motivational_quote_card.dart';
import 'package:flutter/material.dart';

class MotivationalQuotesSection extends StatelessWidget {
  const MotivationalQuotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine grid columns based on screen width
    int crossAxisCount;
    if (screenWidth > AppSizes.desktopBreakpoint) {
      crossAxisCount = 3;
    } else if (screenWidth > AppSizes.tabletBreakpoint) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 1;
    }

    final List<String> quotes = [
      'assets/images/Be_careful.png',
      'assets/images/Don’t_hold.png',
      'assets/images/Don\'t_Focus.png',
      'assets/images/Thank_God.png',
      'assets/images/Why_Your.png',
      'assets/images/If_God.png',
    ];

    return Container(
      color: AppColors.softBeige,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: quotes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 32,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return MotivationalQuoteCard(imagePath: quotes[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
