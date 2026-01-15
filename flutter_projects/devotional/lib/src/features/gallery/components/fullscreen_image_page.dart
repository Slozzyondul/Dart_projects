import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

class FullscreenImagePage extends StatelessWidget {
  final String imageUrl;
  final String? overlayText;
  final String? overlayReference;
  final String heroTag;

  const FullscreenImagePage({
    super.key,
    required this.imageUrl,
    required this.heroTag,
    this.overlayText,
    this.overlayReference,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Hero(
              tag: heroTag,
              child: InteractiveViewer(
                minScale: 0.5,
                maxScale: 4.0,
                child: imageUrl.isEmpty
                    ? _buildQuoteContent()
                    : Image.asset(imageUrl, fit: BoxFit.contain),
              ),
            ),
          ),
          if (overlayText != null || overlayReference != null)
            Positioned(
              bottom: 48,
              left: 24,
              right: 24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (overlayText != null)
                    Text(
                      overlayText!,
                      textAlign: TextAlign.center,
                      style: AppStyles.serifDisplay.copyWith(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          const Shadow(
                            offset: Offset(0, 2),
                            blurRadius: 8,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                  if (overlayReference != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      overlayReference!,
                      style: AppStyles.sansDisplay.copyWith(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          Positioned(
            top: 48,
            right: 24,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 32),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuoteContent() {
    return Container(
      padding: const EdgeInsets.all(48),
      color: AppColors.softBeige,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.format_quote,
            color: AppColors.galleryTaupe,
            size: 64,
          ),
          const SizedBox(height: 24),
          Text(
            overlayText ?? '',
            textAlign: TextAlign.center,
            style: AppStyles.sansDisplay.copyWith(
              fontSize: 24,
              fontStyle: FontStyle.italic,
              color: AppColors.charcoalGrey,
            ),
          ),
        ],
      ),
    );
  }
}
