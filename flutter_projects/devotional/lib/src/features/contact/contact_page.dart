import 'package:devotional/src/common_widgets/app_drawer.dart';
import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
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
    // bg-beige-100 is #f8f3ec. AppColors.softBeige is likely similar.
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
                    _buildHeroSection(),
                    _buildContentSection(),
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

  Widget _buildHeroSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.charcoalGrey.withValues(alpha: 0.1),
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: AspectRatio(
              aspectRatio: 5 / 6,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.stone200,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/Neutral_Beige.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'GET IN TOUCH',
                style: AppStyles.sansDisplay.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                  color: AppColors.charcoalGrey.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Partner in Hope & Healing',
                style: AppStyles.serifDisplay.copyWith(
                  fontSize: 48,
                  height: 1.1,
                  fontStyle: FontStyle.italic,
                  color: AppColors.charcoalGrey,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Lilly Bosek is dedicated to bringing encouragement through worship ministry and storytelling. For booking inquiries, workshops, or general messages of hope, please reach out below.',
                style: AppStyles.sansDisplay.copyWith(
                  fontSize: 18,
                  height: 1.6,
                  fontWeight: FontWeight.w300,
                  color: AppColors.charcoalGrey.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.only(top: 32),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColors.charcoalGrey.withValues(alpha: 0.1),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    _buildContactItem(
                      Icons.mail_outline,
                      'Bosekfavour@gmail.com',
                      'mailto:Bosekfavour@gmail.com',
                    ),
                    const SizedBox(height: 16),
                    _buildContactItem(
                      Icons.call_outlined,
                      '+254 770 417 3734',
                      'tel:+2547704173734',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text, String url) {
    return Row(
      children: [
        Icon(icon, color: AppColors.charcoalGrey.withValues(alpha: 0.7)),
        const SizedBox(width: 16),
        Text(
          text,
          style: AppStyles.sansDisplay.copyWith(
            fontSize: 16,
            color: AppColors.charcoalGrey,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }

  Widget _buildContentSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Booking Form Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Booking & Inquiries',
                style: AppStyles.serifDisplay.copyWith(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  color: AppColors.charcoalGrey,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'RESPONSE TIME: USUALLY WITHIN 48 HOURS',
                style: AppStyles.sansDisplay.copyWith(
                  fontSize: 12,
                  letterSpacing: 1.0,
                  color: AppColors.charcoalGrey.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 40),
              _buildForm(),
            ],
          ),
          const SizedBox(height: 80),
          // Sidebar Section
          Column(
            children: [
              _buildSidebarResource(
                'Event Resources',
                'Access our official media kit for event organizers, including professional biographies, high-resolution photography, and technical riders.',
                'DOWNLOAD PRESS KIT',
              ),
              const SizedBox(height: 48),
              _buildSidebarResource(
                'Digital Fellowship',
                'Join the community online for daily encouragement and behind-the-scenes moments.',
                null,
                child: Row(
                  children: [
                    _buildSocialIcon(Icons.camera_alt), // Instagram placeholder
                    const SizedBox(width: 24),
                    _buildSocialIcon(
                      Icons.video_library,
                    ), // YouTube placeholder
                  ],
                ),
              ),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColors.charcoalGrey.withValues(alpha: 0.1),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      '"A genuine encounter with hope that our community desperately needed. Lilly brings more than music; she brings a presence that transforms the room."',
                      style: AppStyles.serifDisplay.copyWith(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        height: 1.6,
                        color: AppColors.charcoalGrey,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: AppColors.stone200,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/Black Modern Minimalist Reminder Instagram Post.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SARAH JENKINS',
                              style: AppStyles.sansDisplay.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                color: AppColors.charcoalGrey,
                              ),
                            ),
                            Text(
                              'YOUTH DIRECTOR',
                              style: AppStyles.sansDisplay.copyWith(
                                fontSize: 10,
                                letterSpacing: 1.5,
                                color: AppColors.charcoalGrey.withValues(
                                  alpha: 0.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        _buildTextField('FULL NAME', 'Your Name'),
        const SizedBox(height: 24),
        _buildTextField('EMAIL ADDRESS', 'example@email.com'),
        const SizedBox(height: 24),
        _buildDropdown('INQUIRY TYPE', [
          'Worship Ministry',
          'Storytelling Workshop',
          'Speaking Engagement',
          'General Message',
        ]),
        const SizedBox(height: 24),
        _buildTextField('PREFERRED DATE', '', isDate: true),
        const SizedBox(height: 24),
        _buildTextField(
          'YOUR MESSAGE',
          'Tell us about your event or vision...',
          maxLines: 4,
        ),
        const SizedBox(height: 48),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.charcoalGrey,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            child: Text(
              'SEND MESSAGE',
              style: AppStyles.sansDisplay.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
    String label,
    String placeholder, {
    int maxLines = 1,
    bool isDate = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.sansDisplay.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: AppColors.charcoalGrey,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(
              color: AppColors.charcoalGrey.withValues(alpha: 0.4),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.charcoalGrey.withValues(alpha: 0.2),
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.charcoalGrey.withValues(alpha: 0.2),
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.charcoalGrey),
            ),
            suffixIcon: isDate
                ? const Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: AppColors.charcoalGrey,
                  )
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(String label, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.sansDisplay.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: AppColors.charcoalGrey,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          initialValue: items.first,
          items: items.map((item) {
            return DropdownMenuItem(value: item, child: Text(item));
          }).toList(),
          onChanged: (value) {},
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.charcoalGrey.withValues(alpha: 0.2),
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.charcoalGrey.withValues(alpha: 0.2),
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.charcoalGrey),
            ),
          ),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.charcoalGrey,
          ),
        ),
      ],
    );
  }

  Widget _buildSidebarResource(
    String title,
    String description,
    String? linkText, {
    Widget? child,
  }) {
    return Container(
      padding: const EdgeInsets.all(32),
      color: AppColors.stone100.withValues(alpha: 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.serifDisplay.copyWith(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: AppColors.charcoalGrey,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: AppStyles.sansDisplay.copyWith(
              fontSize: 14,
              color: AppColors.charcoalGrey.withValues(alpha: 0.8),
              height: 1.6,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 24),
          if (linkText != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  linkText,
                  style: AppStyles.sansDisplay.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: AppColors.charcoalGrey,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: AppColors.charcoalGrey,
                ),
              ],
            ),
          if (child != null) child,
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Icon(icon, color: AppColors.charcoalGrey, size: 24);
  }
}
