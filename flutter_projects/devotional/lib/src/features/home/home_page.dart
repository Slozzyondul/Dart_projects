import 'package:devotional/src/constants/app_colors.dart';
import 'package:devotional/src/constants/app_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        backgroundColor: AppColors.softBeige,
        body: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeroSection(),
                    _buildQuoteSection(),
                    _buildProjectsSection(),
                    _buildMotivationalQuotesSection(),
                    _buildImpactSection(),
                    _buildNewsletterSection(),
                    _buildFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: AppColors.softBeige,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Lilly Boskek',
              style: AppStyles.serifDisplay.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.warmTaupe,
              ),
            ),
            // Desktop Nav (Hidden on mobile for simplicity, or we can use LayoutBuilder)
            // For now, implementing the mobile view primarily as per standard Flutter practice,
            // but adding the button as it's prominent.
            Row(
              children: [
                // Hidden nav items for simplicity in this first pass, or add if needed.
                // The HTML has a hidden menu for mobile and full nav for desktop.
                // We'll just show the button for now or a menu icon.
                IconButton(
                  icon: const Icon(Icons.menu, color: AppColors.charcoalGrey),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        children: [
          // Image first on mobile in HTML it says order-1 for image on mobile?
          // HTML: order-2 for text, order-1 for image on mobile.
          // Wait, HTML says:
          // <div class="... grid-cols-1 md:grid-cols-2 ...">
          //   <div class="... order-2 md:order-1">Text</div>
          //   <div class="order-1 md:order-2">Image</div>
          // </div>
          // So on mobile (default), Image is Order 1 (top), Text is Order 2 (bottom).
          // On Desktop (md), Text is Order 1 (left), Image is Order 2 (right).

          // Let's stick to mobile layout for simplicity or use a Wrap/Flex with direction.
          // I'll implement the mobile order: Image then Text.
          Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuBAmE5y_1QlZYR3vAtB61bBx5ogNxOdIHjCPzziMYV48QIYUHtZ3wg8RXBZ3ZNLnZ-oKhHAveHp1LkjyoRA4NOUP87hOAvQa9x5CnKDK_qhlU5eJJlx3TfoAcNF5x3SKXazn8qGXWq-GGyjvXw7dNuKlW5MNj3D0WTXlnLJM6GI-cmwOnWZPXu8oonEAJfXU6uGCDNOBj1aYtHy08yssV8Q4m1yX8P9SBHObo94FtZocm_bkFDhkwQJtaBrZz18PVd55mww5SkmZmA',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'WORSHIP MINISTER & STORYTELLER',
                style: AppStyles.sansDisplay.copyWith(
                  color: AppColors.warmTaupe,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'I use music and stories to bring people hope, healing and encouragement through Christ.',
                style: AppStyles.serifDisplay.copyWith(
                  fontSize: 32,
                  height: 1.2,
                  color: AppColors.charcoalGrey,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Christian content creator, worship leader, singer-songwriter, and digital ministry entrepreneur dedicated to building faith-based communities.',
                style: AppStyles.sansDisplay.copyWith(
                  fontSize: 18,
                  color: AppColors.stone600,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.warmTaupe,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Watch Latest Worship',
                      style: AppStyles.sansDisplay.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.warmTaupe,
                      side: const BorderSide(
                        color: AppColors.warmTaupe,
                        width: 2,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Join Community',
                      style: AppStyles.sansDisplay.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuoteSection() {
    return Container(
      width: double.infinity,
      color: AppColors.blueSky,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
      child: Column(
        children: [
          const Icon(Icons.format_quote, color: AppColors.blueAccent, size: 48),
          const SizedBox(height: 24),
          Text(
            '"The Lord is my strength and my shield; my heart trusts in him, and he helps me. My heart leaps for joy, and with my song I praise him."',
            textAlign: TextAlign.center,
            style: AppStyles.serifDisplay.copyWith(
              fontSize: 24,
              fontStyle: FontStyle.italic,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '— PSALM 28:7',
            style: AppStyles.sansDisplay.copyWith(
              color: Colors.blue[700],
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      child: Column(
        children: [
          Text(
            'Ministry Projects',
            style: AppStyles.serifDisplay.copyWith(
              fontSize: 32,
              color: AppColors.charcoalGrey,
            ),
          ),
          const SizedBox(height: 16),
          Container(width: 80, height: 4, color: AppColors.warmTaupe),
          const SizedBox(height: 48),
          _buildProjectCard(
            'Weekly Worship Sessions',
            'A digital sanctuary for corporate praise and intimate worship moments.',
            'https://lh3.googleusercontent.com/aida-public/AB6AXuD_sFXtRhGCDoKrFXUcfeIfY3WtOrNGYD275aqOEuTWirMtWULaXGT6c8TM_4Ch8kbRy-jgJ2k31BkD--Ufwj4oDNyyRjWi1z3LprRl8YLHJdgzlu_uenSX0L2hc0QKCKRfQlQMKnELMVNRvzJFKrXQ_BrHFKSOpprdR8gfOgoni2qqhQOGX1KAQFyMNdcO-AfkBb9rqLdPF7rGjs4hgooDSF-OcJvb52iqQDRaof3HydIJN5jCPX1KCoGUxIsC9wT7RCHDeY2qKpM',
            'Explore',
          ),
          const SizedBox(height: 32),
          _buildProjectCard(
            'Bible Study Videos',
            'Deep dives into Scripture to find daily relevance and spiritual growth.',
            'https://lh3.googleusercontent.com/aida-public/AB6AXuCFyEmRiTvc3_tp4ibPsiwOAWvljKbA5rqeMqzrxr8l_-gFPJhSxVfjMnR106w3M5ovHm_rFbt5nks3Z3_y2JQDOTjkcgS_TIWSyNJTekBf-sByLq-vP8UlnUjcmfJ4wxmE30bp4IUUTwPcAHDQ3lhi0vd1S9TqElHZpM7U--lthJ4Y6PiPMbiO4U1kr2WuOl4imacuvWuL9EA8UP8YXp30U_4h8cmioj6svLmRBIhF2NcjkA03KrzoKjZYwTfI_ZCZX3XpyYBYZFM',
            'Watch',
          ),
          const SizedBox(height: 32),
          _buildProjectCard(
            'Christmas Playlist Project',
            'A seasonal collection of hymns and carols to celebrate the Savior.',
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAFkPhL6Q6Vggwds8Z-gfIm4olbQIzsMEh6dAikQ_G9QtNCgQSJSeV_OZTzvC5t_E23tNPdntIbP-J7H5OEc8We9VoXeHtNBQEysC_vRxeKKvOyhVm7NKgDqe_Rn7vGVM58rFS_gK9WiavgDIvYOx3wm-sKEnv06ofD3MTOtrrRiL6i2aNthzAV6D4P2l-8VJ2YkWvL0MNO0r3GVYxGy2Ra1uwr9bYJfgwW5ajGSfadJ1Ymw54qrMHjx0Ano6gfsp43M4_ARByKrGc',
            'Listen',
          ),
          const SizedBox(height: 48),
          _buildSmallProjectCard(
            Icons.camera_alt,
            'Instagram Quotes',
            'Daily visual inspirations.',
          ),
          const SizedBox(height: 16),
          _buildSmallProjectCard(
            Icons.groups,
            'Tri-Prayer Sessions',
            'Community prayer three times weekly.',
          ),
          const SizedBox(height: 16),
          _buildSmallProjectCard(
            Icons.auto_awesome,
            'Encouragement Series',
            'Short stories for difficult seasons.',
          ),
          const SizedBox(height: 48),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.stone300,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.queue_music, color: AppColors.stone400),
                const SizedBox(width: 16),
                Text(
                  'Collaborations and more projects arriving soon',
                  style: AppStyles.sansDisplay.copyWith(
                    color: AppColors.stone500,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
    String title,
    String description,
    String imageUrl,
    String actionText,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.softBeige,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.stone100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.sansDisplay.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.charcoalGrey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: AppStyles.sansDisplay.copyWith(
                    fontSize: 14,
                    color: AppColors.stone600,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      actionText,
                      style: AppStyles.sansDisplay.copyWith(
                        color: AppColors.warmTaupe,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: AppColors.warmTaupe,
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

  Widget _buildSmallProjectCard(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.stone50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.stone100),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: AppColors.blueSky,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.blue[600], size: 20),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.sansDisplay.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.charcoalGrey,
                ),
              ),
              Text(
                subtitle,
                style: AppStyles.sansDisplay.copyWith(
                  fontSize: 12,
                  color: AppColors.stone500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMotivationalQuotesSection() {
    return Container(
      color: AppColors.softBeige,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      child: Column(
        children: [
          // Simplified grid for quotes - just showing one or stacking them
          _buildQuotePlaceholder(),
          const SizedBox(height: 24),
          _buildQuotePlaceholder(),
          const SizedBox(height: 24),
          _buildQuotePlaceholder(),
        ],
      ),
    );
  }

  Widget _buildQuotePlaceholder() {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(color: AppColors.stone100, width: 4),
        ),
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.stone50,
            border: Border.all(
              color: AppColors.stone300,
              style: BorderStyle.solid,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.image, size: 48, color: AppColors.stone400),
              const SizedBox(height: 8),
              Text(
                'MOTIVATIONAL QUOTE PNG',
                style: AppStyles.sansDisplay.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.stone400,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '1080 x 1080',
                style: AppStyles.sansDisplay.copyWith(
                  fontSize: 10,
                  color: AppColors.stone400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImpactSection() {
    return Container(
      color: AppColors.charcoalGrey,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 96),
      child: Column(
        children: [
          _buildStat('1000+', 'People Reached'),
          const SizedBox(height: 48),
          _buildStat('800+', 'Videos Shared'),
          const SizedBox(height: 48),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => const Icon(Icons.star, color: Colors.amber),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '"Lilly\'s music has been a beacon of hope for me."',
                textAlign: TextAlign.center,
                style: AppStyles.sansDisplay.copyWith(
                  color: AppColors.stone300,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 80),
          Container(height: 1, color: AppColors.stone700),
          const SizedBox(height: 80),
          Text(
            'Heartfelt Testimonials',
            style: AppStyles.serifDisplay.copyWith(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 48),
          _buildTestimonial(
            '"Her weekly worship sessions have become the anchor of my week. Through the most difficult season of my life, Lilly\'s music reminded me that God is still near."',
            'Sarah Jenkins',
            'Community Member',
          ),
          const SizedBox(height: 32),
          _buildTestimonial(
            '"The Bible study series is so accessible. As a busy entrepreneur, I finally found a way to stay grounded in the Word through her digital ministry."',
            'Mark Thompson',
            'Podcast Listener',
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: AppStyles.serifDisplay.copyWith(
            fontSize: 48,
            color: AppColors.warmTaupe,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppStyles.sansDisplay.copyWith(
            color: AppColors.stone400,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildTestimonial(String quote, String name, String role) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.stone800,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -48,
            left: 0,
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: AppColors.warmTaupe,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.format_quote,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quote,
                style: AppStyles.sansDisplay.copyWith(
                  color: AppColors.stone300,
                  fontStyle: FontStyle.italic,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: AppColors.stone700,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppStyles.sansDisplay.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        role,
                        style: AppStyles.sansDisplay.copyWith(
                          color: AppColors.stone500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNewsletterSection() {
    return Container(
      color: AppColors.stone200,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
      child: Column(
        children: [
          Text(
            'Stay Connected',
            style: AppStyles.serifDisplay.copyWith(
              fontSize: 32,
              color: AppColors.charcoalGrey,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Join the faith community and receive weekly encouragement, worship updates, and new story releases directly to your inbox.',
            textAlign: TextAlign.center,
            style: AppStyles.sansDisplay.copyWith(
              color: AppColors.stone600,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          TextField(
            decoration: InputDecoration(
              hintText: 'Your email address',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.warmTaupe,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Subscribe Now',
                style: AppStyles.sansDisplay.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      color: AppColors.softBeige,
      padding: const EdgeInsets.only(top: 64, bottom: 48, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lilly Boskek',
            style: AppStyles.serifDisplay.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.warmTaupe,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Bringing hope, healing, and encouragement through digital ministry, music, and the power of storytelling.',
            style: AppStyles.sansDisplay.copyWith(
              color: AppColors.stone500,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              _buildSocialIcon(Icons.share),
              const SizedBox(width: 16),
              _buildSocialIcon(Icons.music_note),
              const SizedBox(width: 16),
              _buildSocialIcon(Icons.video_library),
            ],
          ),
          const SizedBox(height: 48),
          _buildFooterLinks('QUICK LINKS', [
            'Weekly Worship',
            'Bible Studies',
            'Encouragement Series',
            'Music Playlist',
          ]),
          const SizedBox(height: 48),
          _buildFooterLinks('PARTNER', [
            'Support Ministry',
            'Contact Lilly',
            'Invite to Lead',
          ]),
          const SizedBox(height: 64),
          Container(height: 1, color: AppColors.stone200),
          const SizedBox(height: 32),
          Text(
            '© 2024 Lilly Boskek. All rights reserved.',
            style: AppStyles.sansDisplay.copyWith(
              fontSize: 12,
              color: AppColors.stone400,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                'Privacy Policy',
                style: AppStyles.sansDisplay.copyWith(
                  fontSize: 12,
                  color: AppColors.stone400,
                ),
              ),
              const SizedBox(width: 24),
              Text(
                'Terms of Service',
                style: AppStyles.sansDisplay.copyWith(
                  fontSize: 12,
                  color: AppColors.stone400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.stone200),
      ),
      child: Icon(icon, color: AppColors.stone600, size: 20),
    );
  }

  Widget _buildFooterLinks(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.sansDisplay.copyWith(
            color: AppColors.stone400,
            fontWeight: FontWeight.bold,
            fontSize: 12,
            letterSpacing: 2.0,
          ),
        ),
        const SizedBox(height: 16),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              link,
              style: AppStyles.sansDisplay.copyWith(
                color: AppColors.stone600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
