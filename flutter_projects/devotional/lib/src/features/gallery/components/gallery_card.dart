import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

class GalleryCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final bool isTall;
  final bool isShort;
  final String? overlayText;
  final String? overlayReference;

  const GalleryCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.isTall = false,
    this.isShort = false,
    this.overlayText,
    this.overlayReference,
  });

  @override
  Widget build(BuildContext context) {
    // Determine aspect ratio based on tall/short flags, or use height constraints
    // Since we are in a column, we can just let the image determine height or force it.
    // Design uses explicit grid-row spans, effectively aspect ratios.
    // Tall ~ 45 units, Standard ~ 32 units, Short ~ 25 units.

    double aspectRatio = 1.0;
    if (isTall) {
      aspectRatio = 3 / 4;
    } else if (isShort) {
      aspectRatio = 4 / 3;
    } else {
      aspectRatio = 1.0;
    }

    // Special case for linear gradient background (no image URL, but gradient)
    // The design has one card with linear gradient. We'll handle it if imageUrl starts with "linear-gradient",
    // but for now let's assume valid URLs or handle blank.

    // Actually, one card has "background-image: linear-gradient(...)".
    // We can pass a Color? backgroundGradient or similar, but for simplicity let's stick to network images for now
    // and maybe a placeholder for the gradient one if needed, or just use a solid color.

    // Checking the design again: Card 6 has a linear gradient.
    // Card 2 has "bg-white" and text content (Short / Minimalist).
    // Card 5 also "bg-taupe/5" text quote.

    // It seems "GalleryCard" might need to support "Image Mode" and "Text/Quote Mode".

    if (imageUrl.isEmpty) {
      return _buildQuoteCard(context);
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.galleryTaupe.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: aspectRatio,
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback for gradient/linear-gradient strings from HTML if passed directly
                    return Container(color: AppColors.softBeige);
                  },
                ),
              ),
              if (overlayText != null)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withValues(
                      alpha: 0.2,
                    ), // primary/20 or charcoal/40
                    padding: const EdgeInsets.all(24),
                    child: Center(
                      child: Text(
                        overlayText!,
                        textAlign: TextAlign.center,
                        style: AppStyles.serifDisplay.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
                ),
              // Overlay reference for the sunrise card
              if (overlayReference != null && overlayText != null)
                Positioned(
                  bottom: 24,
                  left: 24,
                  right: 24,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          overlayText!,
                          textAlign: TextAlign.center,
                          style: AppStyles.serifDisplay.copyWith(
                            color: AppColors.charcoalGrey,
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          overlayReference!,
                          textAlign: TextAlign.center,
                          style: AppStyles.sansDisplay.copyWith(
                            color: AppColors.galleryPrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppStyles.sansDisplay.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.charcoalGrey,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: AppStyles.sansDisplay.copyWith(
                        fontSize: 12,
                        color: AppColors.galleryTaupe,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _buildIconButton(Icons.download, AppColors.galleryPrimary),
                    const SizedBox(width: 8),
                    _buildIconButton(Icons.share, AppColors.galleryTaupe),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuoteCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.galleryTaupe.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.0, // Square for quotes
            child: Container(
              padding: const EdgeInsets.all(32),
              color: isShort
                  ? AppColors.galleryTaupe.withValues(alpha: 0.05)
                  : Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.format_quote,
                    color: AppColors.galleryTaupe,
                    size: 32,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    overlayText ?? '',
                    textAlign: TextAlign.center,
                    style: AppStyles.sansDisplay.copyWith(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: AppColors.charcoalGrey,
                    ),
                  ),
                  if (overlayReference != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      overlayReference!,
                      style: AppStyles.sansDisplay.copyWith(
                        fontSize: 12,
                        color: AppColors.galleryTaupe,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (title.isNotEmpty)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppStyles.sansDisplay.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.charcoalGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                _buildIconButton(Icons.download, AppColors.galleryPrimary),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Color color) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }
}
