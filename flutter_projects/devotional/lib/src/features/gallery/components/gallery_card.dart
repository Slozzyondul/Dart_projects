import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:devotional/src/features/gallery/components/fullscreen_image_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class GalleryCard extends StatefulWidget {
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
  State<GalleryCard> createState() => _GalleryCardState();
}

class _GalleryCardState extends State<GalleryCard>
    with SingleTickerProviderStateMixin {
  static const String _baseUrl = 'https://devotional-app.example.com/gallery';
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _animationController.reverse();
    _openFullscreen();
  }

  void _handleTapCancel() {
    _animationController.reverse();
  }

  void _openFullscreen() {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, _, _) => FullscreenImagePage(
          imageUrl: widget.imageUrl,
          heroTag: 'gallery_card_${widget.title}_${widget.imageUrl}',
          overlayText: widget.overlayText,
          overlayReference: widget.overlayReference,
        ),
        transitionsBuilder: (context, animation, _, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  void _handleDownload(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Downloading "${widget.title.isEmpty ? "Quote" : widget.title}"...',
        ),
        backgroundColor: AppColors.galleryPrimary,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _launchShare(
    String platform,
    String shareText,
    String shareUrl,
  ) async {
    String url = '';
    final encodedUrl = Uri.encodeComponent(shareUrl);
    final encodedText = Uri.encodeComponent(shareText);

    switch (platform) {
      case 'whatsapp':
        url = 'https://wa.me/?text=$encodedText%20$encodedUrl';
        break;
      case 'facebook':
        url = 'https://www.facebook.com/sharer/sharer.php?u=$encodedUrl';
        break;
      case 'x':
        url =
            'https://twitter.com/intent/tweet?text=$encodedText&url=$encodedUrl';
        break;
      case 'linkedin':
        url = 'https://www.linkedin.com/sharing/share-offsite/?url=$encodedUrl';
        break;
    }

    if (url.isNotEmpty) {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  void _showShareMenu(BuildContext context) {
    final String shareText =
        'Check out this inspiration from Daily Devotional: "${widget.overlayText ?? widget.title}"';
    final String shareUrl = '$_baseUrl?id=${widget.title.replaceAll(' ', '_')}';

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Share Inspiration',
              style: AppStyles.serifDisplay.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.charcoalGrey,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildShareIcon(
                  context,
                  icon: Icons.chat,
                  label: 'WhatsApp',
                  color: const Color(0xFF25D366),
                  onTap: () => _launchShare('whatsapp', shareText, shareUrl),
                ),
                _buildShareIcon(
                  context,
                  icon: Icons.facebook,
                  label: 'Facebook',
                  color: const Color(0xFF1877F2),
                  onTap: () => _launchShare('facebook', shareText, shareUrl),
                ),
                _buildShareIcon(
                  context,
                  icon: Icons.close,
                  label: 'X',
                  color: Colors.black,
                  onTap: () => _launchShare('x', shareText, shareUrl),
                ),
                _buildShareIcon(
                  context,
                  icon: Icons.business,
                  label: 'LinkedIn',
                  color: const Color(0xFF0A66C2),
                  onTap: () => _launchShare('linkedin', shareText, shareUrl),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.link, color: AppColors.warmTaupe),
              title: const Text('Copy Link'),
              onTap: () {
                Clipboard.setData(ClipboardData(text: shareUrl));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Link copied to clipboard!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShareIcon(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: AppStyles.sansDisplay.copyWith(
              fontSize: 12,
              color: AppColors.stone600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 1.0;
    if (widget.isTall) {
      aspectRatio = 3 / 4;
    } else if (widget.isShort) {
      aspectRatio = 4 / 3;
    }

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.imageUrl.isEmpty
            ? _buildQuoteCard(context)
            : _buildImageCard(context, aspectRatio),
      ),
    );
  }

  Widget _buildImageCard(BuildContext context, double aspectRatio) {
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
              Hero(
                tag: 'gallery_card_${widget.title}_${widget.imageUrl}',
                child: AspectRatio(
                  aspectRatio: aspectRatio,
                  child: Image.asset(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: AppColors.softBeige);
                    },
                  ),
                ),
              ),
              if (widget.overlayText != null)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withValues(alpha: 0.2),
                    padding: const EdgeInsets.all(24),
                    child: Center(
                      child: Text(
                        widget.overlayText!,
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
              if (widget.overlayReference != null && widget.overlayText != null)
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
                          widget.overlayText!,
                          textAlign: TextAlign.center,
                          style: AppStyles.serifDisplay.copyWith(
                            color: AppColors.charcoalGrey,
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          widget.overlayReference!,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: AppStyles.sansDisplay.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.charcoalGrey,
                        ),
                      ),
                      Text(
                        widget.subtitle,
                        style: AppStyles.sansDisplay.copyWith(
                          fontSize: 12,
                          color: AppColors.galleryTaupe,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    _buildIconButton(
                      icon: Icons.download,
                      color: AppColors.galleryPrimary,
                      onPressed: () => _handleDownload(context),
                    ),
                    const SizedBox(width: 8),
                    _buildIconButton(
                      icon: Icons.share,
                      color: AppColors.galleryTaupe,
                      onPressed: () => _showShareMenu(context),
                    ),
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
          Hero(
            tag: 'gallery_card_${widget.title}_${widget.imageUrl}',
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                padding: const EdgeInsets.all(32),
                color: widget.isShort
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
                      widget.overlayText ?? '',
                      textAlign: TextAlign.center,
                      style: AppStyles.sansDisplay.copyWith(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: AppColors.charcoalGrey,
                      ),
                    ),
                    if (widget.overlayReference != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        widget.overlayReference!,
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
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.title.isNotEmpty)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: AppStyles.sansDisplay.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.charcoalGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                Row(
                  children: [
                    _buildIconButton(
                      icon: Icons.download,
                      color: AppColors.galleryPrimary,
                      onPressed: () => _handleDownload(context),
                    ),
                    const SizedBox(width: 8),
                    _buildIconButton(
                      icon: Icons.share,
                      color: AppColors.galleryTaupe,
                      onPressed: () => _showShareMenu(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }
}
