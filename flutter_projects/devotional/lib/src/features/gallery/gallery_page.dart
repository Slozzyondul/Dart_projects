import 'package:devotional/src/common_widgets/app_drawer.dart';
import 'package:devotional/src/features/gallery/components/gallery_filter_bar.dart';
import 'package:devotional/src/features/gallery/components/gallery_header.dart';
import 'package:devotional/src/features/gallery/components/gallery_load_more.dart';
import 'package:devotional/src/features/gallery/components/gallery_masonry_grid.dart';
import 'package:devotional/src/features/home/presentation/home_footer.dart';
import 'package:devotional/src/features/home/presentation/home_header.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  bool _showLoadMore = false;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFDFBF7),
        endDrawer: const AppDrawer(),
        body: Column(
          children: [
            const HomeHeader(),
            Expanded(
              child: NotificationListener<ScrollMetricsNotification>(
                onNotification: (notification) {
                  // Only show "Load More" if content overflows viewport (maxScrollExtent > 0)
                  final hasOverflow = notification.metrics.maxScrollExtent > 0;
                  if (_showLoadMore != hasOverflow) {
                    setState(() {
                      _showLoadMore = hasOverflow;
                    });
                  }
                  return true;
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const GalleryHeader(),
                      const GalleryFilterBar(),
                      const GalleryMasonryGrid(),
                      if (_showLoadMore) const GalleryLoadMore(),
                      const HomeFooter(),
                    ],
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
