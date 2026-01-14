import 'package:devotional/src/common_widgets/app_drawer.dart';
import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:devotional/src/features/gallery/components/gallery_card.dart';
import 'package:devotional/src/features/home/presentation/home_footer.dart';
import 'package:devotional/src/features/home/presentation/home_header.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final List<String> _filters = [
    'All Collections',
    'Daily Devotion',
    'Scripture Art',
    'Minimalist Hope',
    'Gratitude',
  ];

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        backgroundColor: const Color(
          0xFFFDFBF7,
        ), // background-light #fffbf5 ~ish
        endDrawer: const AppDrawer(),
        body: Column(
          children: [
            const HomeHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeadlineSection(),
                    _buildFilterSection(),
                    _buildMasonryGrid(),
                    _buildLoadMoreButton(),
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

  Widget _buildHeadlineSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
      child: Column(
        children: [
          Text(
            'Digital Sanctuary',
            style: AppStyles.serifDisplay.copyWith(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.charcoalGrey,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '"But those who hope in the Lord will renew their strength. They will soar on wings like eagles." — Isaiah 40:31',
            textAlign: TextAlign.center,
            style: AppStyles.sansDisplay.copyWith(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: AppColors.galleryTaupe,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
      child: Row(
        children: _filters.map((filter) {
          final isSelected = filter == 'All Collections';
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.galleryPrimary
                    : AppColors.galleryTaupe.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(100),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: AppColors.galleryPrimary.withValues(
                            alpha: 0.2,
                          ),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Text(
                filter,
                style: AppStyles.sansDisplay.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : AppColors.galleryTaupe,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMasonryGrid() {
    // Manually split data into two columns for masonry effect
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: const [
                GalleryCard(
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuDxdsYhQtJJAM1l8Z-k3cpoa7hociNSLJzJ-LLUAXQiht6_0hwxv8aMWrwFn6oqh52m347yglKnBJZPDtpTpBiDpQDH-kGl5khz3ynWlizOmemksYadJy7S7t9jFwcpZJck5oCfh22N3v-hfF8BbSsewMfCiRxUrMmyVwAhHgLpCiM8hWDDMY4SthxDNjNKHQqznLNURGSvMPr6BxtPZ4R06w-WHa7BPa45J2WCKhLDtyDdlowJZ9rJ2lXn_65TP91i8WPRFsMzADo',
                  title: 'Psalm 46:1',
                  subtitle: 'Sky Blue Series',
                  isTall: true,
                  overlayText: 'God is our refuge and strength.',
                ),
                SizedBox(height: 24),
                // Card 3
                GalleryCard(
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuDkBiBpaNx4ZBXf8whoBnlKch6w9Nb8XZxiC3g2kjJKWJ0Py5CX7xzWapd302xrce6r_b6PG65TlVmzA9CqPMODWhQwztmGv4xmkzESS4CubNi4WVVWAl49w6sxM-fff5aQVN3tuIjYHkcCf1Za8fHj3xbSMufkj732E5aYZ55lHLNEoJSBvdYkBz0AsDOxLWb2BHSqNolnRBO9nTbbm-BqjUCQ22tEcJUNz2ce0KHAkX60cIrGcgEFSHDFmADM39wI-DMZoi_g29c',
                  title: 'Psalm 139:14',
                  subtitle: 'Textured Collection',
                  overlayText: 'Fearfully and Wonderfully Made',
                ),
                SizedBox(height: 24),
                // Card 5 (Quote)
                GalleryCard(
                  imageUrl: '', // Quote card
                  title: '',
                  subtitle: '',
                  isShort: true,
                  overlayText: 'Faith can move mountains.',
                  overlayReference: 'Matthew 17:20',
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              children: const [
                // Card 2
                GalleryCard(
                  imageUrl:
                      '', // Quote card, pretending to include icon logic in GalleryCard for now or just text
                  title: 'Modern Hope',
                  subtitle: '',
                  isShort: true,
                  overlayText: 'Choose joy today.',
                ),
                SizedBox(height: 24),
                // Card 4
                GalleryCard(
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuDhdaWeO9KLn94rdNNQqJHdSt42DVPHJOqlXXyNvplx5GKEdRbjg5Ukn6kb_scdMbk2jBfqVVFHBFrn5E2CviEBt43cB84_q_ccFLTf5gkR-YAojKtGq_lw3l-_eMmwjZP6XPuCtScTOKI1GDVTy5dpf_-tB6HiU6J1kgWJubz2CUq6aTOwG4Zqh6jNAjPUjlvV7wk4TqAfuqmB-IycJCiDI4sIgJVHuSj3Las6gE6K4vFkWjMWhUc_Z40aktrq3cLpiUwJvLbuZUA',
                  title: 'Sunrise Series',
                  subtitle: '',
                  isTall: true,
                  overlayText: '"His mercies are new every morning."',
                  overlayReference: '— Lamentations 3:23',
                ),
                SizedBox(height: 24),
                // Card 6
                GalleryCard(
                  imageUrl:
                      '', // Gradient card? Using quote fallback for now or we could add gradient support.
                  // The design had a linear gradient. Let's just use a placeholder text as it's a quote anyway.
                  title: 'Psalm 46:10',
                  subtitle: 'Stillness Collection',
                  overlayText: 'Be still, and know that I am God.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadMoreButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: [
          Text(
            'Seeking more inspiration?',
            style: AppStyles.sansDisplay.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.galleryTaupe,
            ),
          ),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.galleryTaupe, width: 2),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              foregroundColor: AppColors.galleryTaupe,
            ),
            child: Text(
              'LOAD MORE QUOTES',
              style: AppStyles.sansDisplay.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
