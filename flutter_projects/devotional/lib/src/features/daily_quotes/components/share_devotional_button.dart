import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareDevotionalButton extends StatelessWidget {
  const ShareDevotionalButton({super.key});

  static const String _shareUrl = 'https://devotional-app.example.com/daily';
  static const String _shareText = 'Check out today\'s Daily Devotional! 📖✨';

  Future<void> _launchShare(String platform) async {
    String url = '';
    final encodedUrl = Uri.encodeComponent(_shareUrl);
    final encodedText = Uri.encodeComponent(_shareText);

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
              'Share Devotional',
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
                  onTap: () => _launchShare('whatsapp'),
                ),
                _buildShareIcon(
                  context,
                  icon: Icons.facebook,
                  label: 'Facebook',
                  color: const Color(0xFF1877F2),
                  onTap: () => _launchShare('facebook'),
                ),
                _buildShareIcon(
                  context,
                  icon: Icons.close,
                  label: 'X',
                  color: Colors.black,
                  onTap: () => _launchShare('x'),
                ),
                _buildShareIcon(
                  context,
                  icon: Icons.business,
                  label: 'LinkedIn',
                  color: const Color(0xFF0A66C2),
                  onTap: () => _launchShare('linkedin'),
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
                Clipboard.setData(const ClipboardData(text: _shareUrl));
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
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => _showShareMenu(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.quotesPrimary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.share, size: 20),
              const SizedBox(width: 12),
              Text(
                'Share Devotional',
                style: AppStyles.sansDisplay.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'SPREAD THE WORD • ENCOURAGE A FRIEND',
          style: AppStyles.sansDisplay.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            letterSpacing: 2.0,
            color: AppColors.quotesPrimary.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
