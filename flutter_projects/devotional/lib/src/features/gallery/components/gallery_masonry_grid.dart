import 'package:devotional/src/common_widgets/constants/app_sizes.dart';
import 'package:devotional/src/features/gallery/components/gallery_card.dart';
import 'package:flutter/material.dart';

class GalleryMasonryGrid extends StatelessWidget {
  const GalleryMasonryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        // Determine column count based on width
        int columnCount = 1;
        if (screenWidth > AppSizes.desktopBreakpoint) {
          columnCount = 4;
        } else if (screenWidth > 1000) {
          columnCount = 3;
        } else if (screenWidth > 600) {
          columnCount = 2;
        }

        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppSizes.maxContentWidth,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _buildGrid(columnCount),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGrid(int columnCount) {
    // List of all items
    final List<Widget> items = [
      const GalleryCard(
        imageUrl: 'assets/images/Why_Your.png',
        title: 'Psalm 46:1',
        subtitle: 'Sky Blue Series',
        isTall: true,
        overlayText: 'God is our refuge and strength.',
      ),
      const GalleryCard(
        imageUrl: '', // Quote card
        title: 'Modern Hope',
        subtitle: '',
        isShort: true,
        overlayText: 'Choose joy today.',
      ),
      const GalleryCard(
        imageUrl: 'assets/images/Don\'t_Focus.png',
        title: 'Psalm 139:14',
        subtitle: 'Textured Collection',
        overlayText: 'Fearfully and Wonderfully Made',
      ),
      const GalleryCard(
        imageUrl: 'assets/images/Thank_God.png',
        title: 'Sunrise Series',
        subtitle: '',
        isTall: true,
        overlayText: '"His mercies are new every morning."',
        overlayReference: '— Lamentations 3:23',
      ),
      const GalleryCard(
        imageUrl: '', // Quote card
        title: '',
        subtitle: '',
        isShort: true,
        overlayText: 'Faith can move mountains.',
        overlayReference: 'Matthew 17:20',
      ),
      const GalleryCard(
        imageUrl: '', // Quote card fallback
        title: 'Psalm 46:10',
        subtitle: 'Stillness Collection',
        overlayText: 'Be still, and know that I am God.',
      ),
    ];

    // Distribute items into columns
    final List<List<Widget>> columns = List.generate(columnCount, (_) => []);
    for (int i = 0; i < items.length; i++) {
      columns[i % columnCount].add(items[i]);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(columnCount, (index) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : 12,
              right: index == columnCount - 1 ? 0 : 12,
            ),
            child: Column(
              children: columns[index].map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: item,
                );
              }).toList(),
            ),
          ),
        );
      }),
    );
  }
}
